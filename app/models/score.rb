class Score < ApplicationRecord
  belongs_to :evaluation_instance
  belongs_to :student

  validates_presence_of :student_id, :score

  def to_s
    score
  end

  def approved?
    score >= evaluation_instance.passing_score
  end

end
