require 'test_helper'

class ScoreTest < ActiveSupport::TestCase

                            # 1 assert for test.
                            
  # --- Test for validations ---

  test "some attributes cant be nil (evaluation instance, course)" do 
    assert_not Score.new.valid?
  end

  # --- Test for methods ---


  test 'the result must know if approve or not, in this case, disapproved' do 
    assert_not scores(:three).approved?
  end

  test 'the result must know if approve or not, in this case, approved' do 
    assert scores(:one).approved?
  end

  # Tests for range (must be between 0 and top score)

  test 'the result must know if its in range or not, in this case, no for score > top score' do 
    student = scores(:three).evaluation_instance.course.students.build(course: courses(:two), last_name: "Brost", name: "Pepe", dni: 38659423, student_number: 56564/5, email: "pepo.brost@gmail.com")
    another_score = scores(:three).evaluation_instance.scores.build(evaluation_instance: evaluation_instances(:two), student: student, score: 600)
    assert_not another_score.range?
  end

  test 'the result must know if its in range or not, in this case, no for score < 0' do 
    student = scores(:three).evaluation_instance.course.students.build(course: courses(:two), last_name: "Brost", name: "Pepe", dni: 38659423, student_number: 56564/5, email: "pepo.brost@gmail.com")
    another_score = scores(:three).evaluation_instance.scores.build(evaluation_instance: evaluation_instances(:two), student: student, score: -1)
    assert_not another_score.range?
  end

  test 'the result must know if its in range or not, in this case, yes' do 
    assert scores(:three).range?
  end

end
