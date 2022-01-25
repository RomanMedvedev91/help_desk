class UsersController < ApplicationController
  include TwilioControls   # sms module

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!
    @user.user_type_id = UserType.find_by_code('User').id
    
    if @user.save

      begin  #if the mobile # is not registered (free) we will get an error
        #send mail for new user
        UserMailer.welcome_email(@user).deliver_now
        flash.now[:success] = "Email has been sent"

        # send sms
        send_sms(@user.mobile, "Welcome to helpdesk #{@user.name}")
      rescue
        #do nothing
      else
        #do nothing
      ensure
        #do nothing
      end

      # If user saves in the db successfully:
      #flash[:notice] = "Account created successfully!"
      #redirect_to root_path
      session[:user_id] = @user.id

      redirect_to [:tickets], notice: 'Account created Successfully!'
    else
      # If user fails model validation - probably a bad password or duplicate email:
      flash.now.alert = "Oops, couldn't create account. Please make sure you are using a valid email and password and try again."
      render :new
    end
  end

private

  def user_params
    # strong parameters - whitelist of allowed fields #=> permit(:name, :email, ...)
    # that can be submitted by a form to the user model #=> require(:user)
    params.require(:user).permit(:name, :mobile, :email, :password, :password_confirmation)
  end
end
