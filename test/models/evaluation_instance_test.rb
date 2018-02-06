require 'test_helper'

class EvaluationInstanceTest < ActiveSupport::TestCase

                            # 1 assert for test.
                            
  def setup
    @instance = evaluation_instances(:one)
  end

  # --- Test for validations ---

  test "some attributes (title, date, passing score and top score) cant be nil" do 
    assert_not EvaluationInstance.new.valid?
  end

  test "passing score cant be bigger than top score" do
    assert_not EvaluationInstance.new(course: courses(:one), title: "Test one", date: 2017-1-12, passing_score: 5, top_score: 1).valid?
  end

  test "title must be unique in a course" do # see ../test/fixtures/evaluation_instances.yml
    assert_not EvaluationInstance.new(course: courses(:one), title: "First test", date: 2017-1-10, passing_score: 5, top_score: 10).valid?
  end 

  # --- Tests for methods --- 

  test "must know the number of disapproved students" do
    assert_equal(1, @instance.number_of_disapproved)
  end 

  test "must know the number of approved students" do 
    assert_equal(1, @instance.number_of_approved)
  end 

  test "must know the number of absent students" do # Course "one" only have one student, Franco Liptak. He is absent if he haven't score in the evaluation.
    evaluation = courses(:one).evaluation_instances.build(title: "test", date: 2017-12-1, passing_score: 5, top_score: 10)
    assert_equal(1, evaluation.number_of_absentees)
  end

  test "must know the percentage of approved students, in this case, 0.0" do
    evaluation = courses(:one).evaluation_instances.build(title: "test 2", date: 2017-12-2, passing_score: 5, top_score: 10)
    assert_equal(0.0, evaluation.percentage_of_approved)
  end 

  test "must know the percentage of approved students, in this case, 100.0" do
    evaluation = courses(:two).evaluation_instances.build(title: "test 3", date: 2017-12-3, passing_score: 5, top_score: 10)
    evaluation.scores.build(student: students(:one), score: 9)
    assert_equal(100.00, evaluation.percentage_of_approved)
  end
  
end
