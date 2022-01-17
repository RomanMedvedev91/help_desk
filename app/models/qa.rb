class Qa < ActiveRecord::Base
  belongs_to :qa_category

  validates :problem, presence: true
  validates :solution, presence: true
end
