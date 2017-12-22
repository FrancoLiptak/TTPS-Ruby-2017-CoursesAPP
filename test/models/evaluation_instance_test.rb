require 'test_helper'

class EvaluationInstanceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "title cant be nil" do 
    evaluation = evaluation_instances(:one)
    evaluation.title = nil 
    assert_not evaluation.save
  end

  test "passing score cant be nil" do 
    evaluation = evaluation_instances(:one)
    evaluation.passing_score = nil 
    assert_not evaluation.save
  end

  test "top score cant be nil" do 
    evaluation = evaluation_instances(:one)
    assert_not evaluation.top_score = nil 
  end

  test "passing score cant be bigger than top score" do 
    evaluation = evaluation_instances(:one)
    evaluation.passing_score = 5
    evaluation.top_score = 1
    assert_not evaluation.save
  end

  test "this evaluation instance must be created" do 
    evaluation = evaluation_instances(:one)
    assert evaluation.save
  end 

  test "title must be unique in a course" do 
    evaluation = evaluation_instances(:one)
    another_evaluation = evaluation_instances(:two)
    evaluation.title = another_evaluation.title
    evaluation.course = another_evaluation.course
    assert_not evaluation.valid?
  end 

  test "must know the number of approved students" do 
    evaluation = evaluation_instances(:one)
    assert_equal(1, evaluation.number_of_approved)
  end 

  test "must know the number of disapproved students" do
    evaluation = evaluation_instances(:one)
    assert_equal(1, evaluation.number_of_disapproved)
  end 

end
