class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create

    if @user = User.authenticate_with_credentials(params[:email], params[:password])
      # success logic, log them in
      session[:user_id] = @user.id
      #send mail for new user
      UserMailer.welcome_email(@user).deliver_now
      flash.now[:success] = "Email has been sent"
      redirect_to '/'
    else
      # failure, render login form
      #redirect_to '/login'
      flash.now[:error] = "Error! Try again"
      render :new
    end

    # user = User.find_by_email(params[:email])
    # # If the user exists AND the password entered is correct.
    # if user && user.authenticate(params[:password])
    #   # Save the user id inside the browser cookie. This is how we keep the user 
    #   # logged in when they navigate around our website.
    #   session[:user_id] = user.id
    #   redirect_to '/'
    # else
    # # If user's login doesn't work, send them back to the login form.
    #   redirect_to '/login'
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end


# class SessionsController < ApplicationController
#   def new
#     # No need for anything in here, we are just going to render our
#     # new.html.erb AKA the login page
#   end

#   def create
#     # Look up User in db by the email address submitted to the login form and
#     # convert to lowercase to match email in db in case they had caps lock on:
#     user = User.find_by_email: params[:login][:email].downcase)
    
#     # Verify user exists in db and run has_secure_password's .authenticate() 
#     # method to see if the password submitted on the login form was correct: 
#     if user && user.authenticate(params[:login][:password]) 
#       # Save the user.id in that user's session cookie:
#       session[:user_id] = user.id.to_s
#       redirect_to root_path, notice: 'Successfully logged in!'
#     else
#       # if email or password incorrect, re-render login page:
#       flash.now.alert = "Incorrect email or password, try again."
#       render :new
#     end
#   end

#   def destroy
#     # delete the saved user_id key/value from the cookie:
#     session.delete(:user_id)
#     redirect_to login_path, notice: "Logged out!"
#   end
# end
