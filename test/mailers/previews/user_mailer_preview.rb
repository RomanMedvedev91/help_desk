# Preview all emails at http://localhost:3000/rails/mailers/user
class UserMailerPreview < ActionMailer::Preview

  # default from: 'notifications@example.com'
 def new_user_email
  @user = User.new({
    first_name: "Roman", 
    last_name: "Medvedev", 
    email: "medvedev.roman91.mr@gmail.com", 
    password: "123456", 
    password_confirmation: "123456"})
    
    UserMailer.welcome_email(@user).deliver_now

  end

end
