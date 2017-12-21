class Score < ApplicationRecord
  belongs_to :evaluation_instance
  belongs_to :student

  validates_presence_of :student_id, :score
end
