CREATE OR REPLACE FUNCTION ticket_insert_f() RETURNS trigger AS $ticket_insert$
declare
	rec_technician record;

  tech_id integer;
	bus_days integer;
  bus_hours integer;

  v_priority varchar;
  v_status_code varchar;
  v_type varchar;

  v_name varchar;

  cur_technician cursor for
		SELECT technician_id, count(*) AS ticket_count, sum (age(to_be_solved_at , now())) AS total_time
		FROM tickets
    INNER JOIN ticket_status_codes ON tickets.ticket_status_code_id = ticket_status_codes.id
    WHERE ticket_status_codes.code <> 'Closed'
      AND tickets.technician_id IS NOT NULL
    GROUP BY technician_id
    ORDER BY ticket_count DESC,total_time DESC
    LIMIT 1;

begin
  IF NEW.user_id IS NULL THEN
    RAISE EXCEPTION 'User Id cannot be null';
  END IF;

  if NEW.technician_id IS NULL THEN
    open cur_technician;               -- open the cursor
    loop
      fetch cur_technician into rec_technician;
      exit when not found;             -- exit when no more row to fetch
      tech_id = rec_technician.technician_id;
    end loop;
    close cur_technician;              -- close the cursor
  ELSE
    tech_id = NEW.technician_id;
  END IF;

  SELECT name
    INTO v_name
    FROM users
  WHERE id = tech_id;


  SELECT code,business_days,business_hours
    INTO v_priority,bus_days, bus_hours
    FROM ticket_priorities
   WHERE id = NEW.ticket_priority_id;

  SELECT code
    INTO v_status_code
    FROM ticket_status_codes
   WHERE id = NEW.ticket_status_code_id;
  
  SELECT code 
    INTO v_type 
    FROM ticket_types 
   WHERE id = NEW.ticket_type_id;

  NEW.technician_id = tech_id;
  NEW.assigned_at = now();
  NEW.to_be_solved_at = now() + bus_days * INTERVAL '1 day' + bus_hours * INTERVAL ' 1 hour';

  INSERT INTO user_notifications(user_id,ticket_id,notification_type,send_email,send_sms,created_at,updated_at)
                          VALUES(tech_id,NEW.id,'assigned',1,1,NOW(),NOW());

  INSERT INTO user_notifications(user_id,ticket_id, notification_type,send_email,send_sms,created_at,updated_at)
                          VALUES(NEW.user_id, NEW.id,'new', 1, 1, NOW(), NOW());

  UPDATE stat_tickets set no_of_tickets = no_of_tickets + 1, updated_at = NOW()
  WHERE code = v_priority and this_date = current_date;
  IF NOT FOUND THEN -- UPDATE didn't touch anything
    INSERT INTO stat_tickets (code, no_of_tickets,this_date,record_type,created_at,updated_at)
                      VALUES (v_priority, 1, current_date, 1, NOW(),NOW());
  END IF;

  UPDATE stat_tickets set no_of_tickets = no_of_tickets + 1, updated_at = NOW()
  WHERE code = v_status_code and this_date = current_date;
  IF NOT FOUND THEN -- UPDATE didn't touch anything
    INSERT INTO stat_tickets (code, no_of_tickets,this_date,record_type,created_at,updated_at)
       VALUES (v_status_code, 1, current_date, 2,NOW(),NOW());
  END IF;

  UPDATE stat_tickets set no_of_tickets = no_of_tickets + 1, updated_at = NOW()
  WHERE code = v_type and this_date = current_date;
  IF NOT FOUND THEN -- UPDATE didn't touch anything
    INSERT INTO stat_tickets (code, no_of_tickets,this_date,record_type,created_at,updated_at)
       VALUES (v_type, 1, current_date, 3, NOW(),NOW());
  END IF;

  UPDATE stat_technicians set assigned = assigned + 1, updated_at = NOW()
  WHERE name = v_name and this_date = current_date;
  IF NOT FOUND THEN -- UPDATE didn't touch anything
    INSERT INTO stat_technicians (name,   this_date   , assigned, solved, transferred,created_at,updated_at)
                          VALUES (v_name, current_date, 1, 0, 0,NOW(),NOW());
  END IF;
  
  NEW.created_at = NOW();
  NEW.updated_at = NOW();

  RETURN NEW;
end; 
$ticket_insert$ LANGUAGE plpgsql;







CREATE OR REPLACE FUNCTION ticket_update_f() RETURNS trigger AS $ticket_update$
declare
  status_id integer;
	bus_days integer;
  bus_hours integer;

  new_technician varchar;
  old_technician varchar;

  new_priority varchar;
  old_priority varchar;
  new_status varchar;
  old_status varchar;
  new_type varchar;
  old_type varchar;

  status_closed_id integer;
begin

  IF NEW.user_id IS NULL THEN
    RAISE EXCEPTION 'User Id cannot be null';
  END IF;

  SELECT id 
    INTO status_closed_id 
    FROM ticket_status_codes 
   WHERE code = 'Closed';

  if OLD.technician_id <> NEW.technician_id THEN
    NEW.assigned_at = now();

    select name into new_technician from users where id = NEW.technician_id;
    select name into old_technician from users where id = OLD.technician_id;

    DELETE FROM user_notifications 
    WHERE user_id = OLD.technician_id
      AND ticket_id = OLD.id
      AND (send_email = 1 OR send_sms = 1);

    INSERT INTO user_notifications(user_id,ticket_id, notification_type,send_email,send_sms,created_at,updated_at)
                          VALUES(NEW.technician_id,OLD.id,'assigned',1,1,NOW(),NOW());

    UPDATE stat_technicians set assigned = assigned + 1, updated_at = now()
    WHERE name = new_technician and this_date = current_date;
    IF NOT FOUND THEN -- UPDATE didn't touch anything
      INSERT INTO stat_technicians (name,   this_date   , assigned, solved, transferred,created_at,updated_at)
                            VALUES (new_technician, current_date, 1, 0, 0, NOW(),NOW());
    END IF;
    
    UPDATE stat_technicians set transferred = transferred + 1, updated_at =  NOW()
    WHERE name = old_technician and this_date = current_date;
    IF NOT FOUND THEN -- UPDATE didn't touch anything
      INSERT INTO stat_technicians (name,   this_date   , assigned, solved, transferred,created_at,updated_at)
                            VALUES (old_technician, current_date, 0, 0, 1, NOW(), NOW());
    END IF;
  END IF;



  if OLD.ticket_status_code_id <> NEW.ticket_status_code_id THEN
    select code into new_status from ticket_status_codes where id = NEW.ticket_status_code_id;
    select code into old_status from ticket_status_codes where id = OLD.ticket_status_code_id;

    UPDATE stat_tickets set no_of_tickets = no_of_tickets + 1, updated_at = NOW()
     WHERE code = new_status and this_date = current_date;
    IF NOT FOUND THEN -- UPDATE didn't touch anything
      INSERT INTO stat_tickets (code, no_of_tickets,this_date,record_type,created_at,updated_at)
                        VALUES (new_status, 1, current_date, 2, NOW(),NOW());
    END IF;

    if NEW.ticket_status_code_id = status_closed_id THEN
      INSERT INTO user_notifications(user_id,ticket_id,notification_type,send_email,send_sms,created_at,updated_at)
                            VALUES(OLD.user_id,OLD.id,'closed',1,1, NOW(), NOW());

      NEW.closed_at = NOW();
    END IF;
  END IF;


  if OLD.ticket_priority_id <> NEW.ticket_priority_id THEN
    bus_days = 0;
    bus_hours = 0;

    select code, business_days, business_hours 
    into new_priority, bus_days, bus_hours
    from ticket_priorities
    where id = NEW.ticket_priority_id;

    select code
      into old_priority 
      from ticket_priorities 
     where id = OLD.ticket_priority_id;

    UPDATE stat_tickets set no_of_tickets = no_of_tickets + 1, updated_at = NOW()
     WHERE code = new_priority and this_date = current_date;
    IF NOT FOUND THEN -- UPDATE didn't touch anything
      INSERT INTO stat_tickets (code, no_of_tickets,this_date,record_type,created_at,updated_at)
                        VALUES (new_priority, 1, current_date, 1, NOW(),NOW());
    END IF;

    NEW.to_be_solved_at = OLD.created_at +  bus_days * INTERVAL '1 day' + bus_hours * INTERVAL ' 1 hour';
  END IF;

  if OLD.ticket_type_id <> NEW.ticket_type_id THEN
    select code into new_type from ticket_types where id = NEW.ticket_type_id;
    select code into old_type from ticket_types where id = OLD.ticket_type_id;

    UPDATE stat_tickets set no_of_tickets = no_of_tickets + 1, updated_at = NOW()
     WHERE code = new_type and this_date = current_date;
    IF NOT FOUND THEN -- UPDATE didn't touch anything
      INSERT INTO stat_tickets (code, no_of_tickets,this_date,record_type,created_at,updated_at)
                        VALUES (new_type, 1, current_date, 3, NOW(), NOW());
    END IF;
  END IF;

  NEW.updated_at = NOW();
  RETURN NEW;
END; 
$ticket_update$ LANGUAGE plpgsql;


DROP TRIGGER IF EXISTS ticket_insert_t ON tickets;
CREATE TRIGGER ticket_insert_t
    BEFORE INSERT ON tickets
    FOR EACH ROW
    EXECUTE PROCEDURE ticket_insert_f();

DROP TRIGGER IF EXISTS ticket_update_t ON tickets;
CREATE TRIGGER ticket_update_t
    BEFORE UPDATE ON tickets
    FOR EACH ROW
    EXECUTE PROCEDURE ticket_update_f();