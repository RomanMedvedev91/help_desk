class TicketPriority < ActiveRecord::Base
  has_many :tickets

  validates :code, presence: true
end
