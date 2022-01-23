def process_notifications

  @notifications = UserNotification.where("send_email = 1")

  @notifications.each {|notification|
    @user = User.find(notification.user_id)
    if notification.ticket_id != 0
      @ticket = Ticket.find(notification.ticket_id)
    end
    
    if notification.type == 'welcome'
      UserMailer.welcome_email(@user).deliver_now

    elsif notification.type == 'new'
      UserMailer.opened_ticket(@user).deliver_now

    elsif notification.type == 'closed'
      UserMailer.closeed_ticket(@user).deliver_now

    elsif notification.type == 'assigned'
      UserMailer.assigned_ticket(@user).deliver_now

    end

    @notification.send_email = 0
    @notification.save
  }

  @notifications = UserNotification.where("send_sms = 1")

  @notifications.each {|notification|
    @user = User.find(notification.user_id)
    if notification.ticket_id != 0
      @ticket = Ticket.find(notification.ticket_id)
    end

    if notification.type == 'welcome'
      send_sms(@user.mobile, "Welcome to helpdesk #{@ticket.reference}")
    
    elsif notification.type == 'new'
      send_sms(@user.mobile, "Your Ticket Ref. #{@ticket.reference} was successfully received!")
    
    elsif notification.type == 'closed'
      send_sms(@user.mobile, "Your Ticket Ref. #{@ticket.reference} has been closed")
    
    elsif notification.type == 'assigned'
      send_sms(@user.mobile, "You have been assigned a new ticket with a Ref. #{@ticket.reference}")
    end

    @notification.send_sms = 0
    @notification.save
  }

end
