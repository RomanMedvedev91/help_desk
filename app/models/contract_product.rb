class ContractProduct < ActiveRecord::Base
  belongs_to :contract
  belongs_to :product
  has_many :tickets
end
