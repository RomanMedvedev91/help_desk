class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    # store all emails in lowercase to avoid duplicates and case-sensitive login errors:
    @user.email.downcase!
    @user.user_type_id = UserType.find_by_code('User').id
    
    if @user.save

      #send mail for new user
      UserMailer.welcome_email(@user).deliver_now
      flash.now[:success] = "Email has been sent"
      
      # If user saves in the db successfully:
      flash[:notice] = "Account created successfully!"
      redirect_to root_path
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
    params.require(:user).permit(:name, :mobile, :email, :user_type_id, :password, :password_confirmation)
  end
end
