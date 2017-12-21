class Score < ApplicationRecord
  belongs_to :evaluation_instance
  belongs_to :student

  validates_presence_of :student_id, :evaluation_instance_id, :score
  validates :student, uniqueness: { scope: :evaluation_instance }
  validates :evaluation_instance, uniqueness: { scope: :student }

  validates :score, presence: true, numericality: { only_integer: true }
  validate :range


  def to_s
    score
  end

  def range
    if !((score > 0) && (score <= evaluation_instance.top_score))
      errors.add(:score, "the score must be greater than 0 and less than the maximum score")
    end
  end

  def approved?
    score >= evaluation_instance.passing_score
  end

end
