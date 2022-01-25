class Notifications
  include TwilioControls   # sms module
  def notify_users
    @notifications = UserNotification.where("send_email = 1")

    @notifications.each {|notification|
      @user = User.find_by_id(notification.user_id)

      if notification.ticket_id != 0
        @ticket = Ticket.find_by_id(notification.ticket_id)
      end

      begin
        if notification.notification_type == 'welcome'
          UserMailer.welcome_email(@user).deliver_now

        elsif notification.notification_type == 'new'
          UserMailer.opened_ticket(@user, @ticket).deliver_now

        elsif notification.notification_type == 'closed'
          UserMailer.closed_ticket(@user, @ticket).deliver_now

        elsif notification.notification_type == 'assigned'
          UserMailer.assigned_ticket(@user, @ticket).deliver_now
        end
      rescue
        puts "Email ==> An Error Occurred"
      else
        #do nothing
      ensure
        notification.send_email = 0
        notification.email_sent_at = DateTime.now
        notification.save
      end
    }


    @notifications = UserNotification.where("send_sms = 1")

    @notifications.each {|notification|
      @user = User.find_by_id(notification.user_id)
      if notification.ticket_id != 0
        @ticket = Ticket.find_by_id(notification.ticket_id)
      end

      begin
        if notification.notification_type == 'welcome'
          send_sms(@user.mobile, "Welcome to helpdesk #{@ticket.reference}")
        
        elsif notification.notification_type == 'new'
          send_sms(@user.mobile, "Your Ticket Ref. #{@ticket.reference} was successfully received!")
        
        elsif notification.notification_type == 'closed'
          send_sms(@user.mobile, "Your Ticket Ref. #{@ticket.reference} has been closed")
        
        elsif notification.notification_type == 'assigned'
          send_sms(@user.mobile, "You have been assigned a new ticket with a Ref. #{@ticket.reference}")
        end
      rescue
        puts "SMS ==> An Error Occurred"
      else
        #do nothing
      ensure
        notification.send_sms = 0
        notification.sms_sent_at = DateTime.now
        notification.save
      end
    }
  end
end
