class Contract < ActiveRecord::Base
  has_many :contract_products
  belongs_to :user
  belongs_to :service_level_agreement

end
