class EvaluationInstance < ApplicationRecord
  belongs_to :course
  has_many :scores

  validates_presence_of :date, :passing_score, :top_score, :title
  validates :title, :uniqueness => {:scope => [:course_id]}
  validates :passing_score, numericality: { greater_than_or_equal_to: 0,
                                            less_than_or_equal_to: :top_score,
                                            message: "the passing score must be less than the top score" }

  accepts_nested_attributes_for :scores, reject_if: proc { |a| a['score'].blank? }


  def score_of_student student
    scores.where(student: student).first
  end

  def present_student? student 
    ! scores.where(student: student).empty?
  end

  def number_of_disapproved
    scores.size - number_of_approved
  end

  def number_of_approved
    scores.select(&:approved?).size
  end

  def number_of_absentees
    course.students.size - scores.all.to_a.size
  end

  def percentage_of_approved
    number_of_approved * 100.00 / course.students.size
  end
end
