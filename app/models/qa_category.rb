class QaCategory < ActiveRecord::Base
  has_many :qas

  validates :code, presence: true
end
