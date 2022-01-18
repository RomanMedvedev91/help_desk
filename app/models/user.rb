class User < ActiveRecord::Base
  belongs_to :user_type

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true , uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }#, confirmation: { case_sensitive: true }
  #validates :password_confirmation, presence: true, length: { minimum: 6 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :mobile, :email, :user_type_id, :password, :password_confirmation )
  end

end
