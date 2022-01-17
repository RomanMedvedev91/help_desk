class Ticket < ActiveRecord::Base
  belongs_to :ticket_priority
  belongs_to :ticket_status_code
  belongs_to :ticket_type
  belongs_to :user
  belongs_to :contract_product
  has_many :notes

  validates :problem_description, presence: true
end
