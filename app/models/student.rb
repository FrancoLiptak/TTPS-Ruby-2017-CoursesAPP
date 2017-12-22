class Student < ApplicationRecord
  belongs_to :course
  has_many :scores


  validates_presence_of :last_name, :name, :dni, :student_number, :email

  validates_format_of :email, :with =>/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates_format_of :last_name, :name, :with =>/\A(?:[-a-z']+|[-a-z']+\s[-a-z']*\s?[-a-z']+)\z/i 
  
  validates :dni, uniqueness: { scope: [:course_id], message: "the DNI must be unique within the same course" }, numericality: { only_integer: true, greater_than: 0 }
  validates :student_number, uniqueness: { scope: [:course_id], message: "the student number must be unique within the same course" }

  def summary
    "#{last_name} #{name} - #{student_number}"
  end

  def you_already_have_score?(evaluation)
    !(Score.has_score_for(self, evaluation).empty?)
  end

end
