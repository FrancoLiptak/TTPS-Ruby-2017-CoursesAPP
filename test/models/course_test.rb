require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  def setup
    @course = courses(:one)
  end

  # --- Test for validations ---

  test "this course must be created" do 
    assert @course.valid?
  end 

  test "'year' can't be nil" do
    @course.year = nil
    assert_not @course.valid?
  end

  test "'year' must be unique" do
    @course.year = 2020
    @course.save
    another_course = courses(:two)
    another_course.year = 2020
    assert_not another_course.valid?
  end

  test "the course can't be old" do 
    @course.year = 1000
    assert_not @course.valid?
  end

  # --- tests for methods isn't necessary ---
end
