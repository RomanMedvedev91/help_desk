class Category < ActiveRecord::Base
  has_many :products

  validates :code, presence: true
end
