class UserMailer < ApplicationMailer
  def welcome_email(user)  
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(  
    to: @user.email, 
    subject: 'Welcome to Help Desk',
  )
  end

  def opened_ticket(user,ticket)
    @user = user
    @ticket = ticket
    @url  = 'http://localhost:3000/login'
    mail(
    to: @user.email, 
    subject: 'Welcome to Help Desk',
  )
  end

  def closed_ticket(user,ticket)
    @user = user
    @ticket = ticket
    @url  = 'http://localhost:3000/login'
    mail(
    to: @user.email, 
    subject: 'Welcome to Help Desk',
  )
  end

  def assigned_ticket(user,ticket)
    @user = user
    @ticket = ticket
    @url  = 'http://localhost:3000/login'
    mail(
    to: @user.email, 
    subject: 'Welcome to Help Desk',
  )
  end
end
