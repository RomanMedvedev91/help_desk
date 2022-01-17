class UserType < ActiveRecord::Base
  has_many :users

  validates :code, presence: true
end
