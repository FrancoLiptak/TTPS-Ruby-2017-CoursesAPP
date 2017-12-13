class EvaluationInstance < ApplicationRecord
  belongs_to :course
  has_many :scores

  validates_presence_of :date, :passing_score, :top_score

  validates :title, presence: true, uniqueness: true
end
