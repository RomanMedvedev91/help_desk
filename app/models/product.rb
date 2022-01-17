class Product < ActiveRecord::Base
  belongs_to :category
  has_many :contract_products

  validates :code, presence: true
end


