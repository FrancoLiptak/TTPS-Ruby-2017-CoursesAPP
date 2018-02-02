require 'test_helper'

class EvaluationInstanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  # --- Test for validations ---

  test "title cant be nil" do 
    evaluation = evaluation_instances(:one)
    evaluation.title = nil 
    assert_not evaluation.valid?
  end

  test "passing score cant be nil" do 
    evaluation = evaluation_instances(:one)
    evaluation.passing_score = nil 
    assert_not evaluation.valid?
  end

  test "top score cant be nil" do 
    evaluation = evaluation_instances(:one)
    assert_not evaluation.top_score = nil 
  end

  test "passing score cant be bigger than top score" do 
    evaluation = evaluation_instances(:one)
    evaluation.passing_score = 5
    evaluation.top_score = 1
    assert_not evaluation.valid?
  end

  test "this evaluation instance must be created" do 
    evaluation = evaluation_instances(:one)
    assert evaluation.valid?
  end 

  test "title must be unique in a course" do 
    evaluation = evaluation_instances(:one)
    another_evaluation = evaluation_instances(:two)
    evaluation.title = another_evaluation.title
    evaluation.course = another_evaluation.course
    assert_not evaluation.valid?
  end 

  # --- Tests for class methods --- 

  test "the student must be absent" do 
    evaluation = evaluation_instances(:two)
    student = evaluation.course.students.build(course: courses(:one), last_name: "Brost", name: "Pepe", dni: 38659423, student_number: 56564/5, email: "pedro.brost97@gmail.com")
    assert_not (evaluation.present_student? student)
  end
  
  test "the student must be present" do 
    evaluation = evaluation_instances(:one)
    student = evaluation.course.students.build(course: courses(:one), last_name: "Brost", name: "Pepe", dni: 38659423, student_number: 56564/5, email: "pedro.brost97@gmail.com")
    evaluation.scores.build(score: 20, student: student)
    assert (evaluation.present_student? students(:one))
  end 

  test "must know the number of disapproved students" do
    evaluation = evaluation_instances(:one)
    assert_equal(1, evaluation.number_of_disapproved)
  end 

  test "must know the number of approved students" do 
    evaluation = evaluation_instances(:one)
    assert_equal(1, evaluation.number_of_approved)
  end 

  test "must know the percentage of approved students" do
    evaluation = courses(:one).evaluation_instances.build(course: courses(:one), title: "test", date: 2017-12-1, passing_score: 5, top_score: 10)
    assert_equal(0, evaluation.percentage_of_approved )
    evaluation.scores.build(student: students(:one), score: 1)
    
    assert_equal(1, evaluation.scores.all)
  end 

  test "must know the number of absent students" do 
    evaluation = evaluation_instances(:two)
    assert_equal(1, evaluation.number_of_absentees)
  end

  test "the score must be equal to score specificate" do 
    evaluation = evaluation_instances(:one)
    assert_equal(80, (evaluation.score_of_student students(:one)))
  end

  
end
