require 'test_helper'

class ScoreTest < ActiveSupport::TestCase

  def setup
    @score = scores(:one)
  end

  # --- Test for validations ---

  test "the result must belong to a student" do 
    @score.student = nil 
    assert_not @score.valid?
  end


  test "the result must belong to a asd" do 
    assert_not @score.evaluation_instance = nil
  end

  test "the result must be bigger than 0" do 
    @score.score = -80 
    assert_not @score.valid?
  end

  test 'this score must be created' do
    assert @score.valid?
  end

  # --- Test for methods ---

  test 'the result must know if approve or not' do 
    score = scores(:three)
    assert_not score.approved?

    score = scores(:one)
    assert score.approved?
  end

  test 'the result must know if its in range or not' do 
    score = scores(:three)
    assert score.range?

    student = score.evaluation_instance.course.students.build(course: courses(:two), last_name: "Brost", name: "Pepe", dni: 38659423, student_number: 56564/5, email: "pepo.brost@gmail.com")
    another_score = score.evaluation_instance.scores.build(evaluation_instance: evaluation_instances(:two), student: student, score: -5)
    assert_not another_score.range?
  end

end
