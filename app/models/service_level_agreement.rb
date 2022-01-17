class ServiceLevelAgreement < ActiveRecord::Base
  has_many :contracts

  validates :code, presence: true

end
