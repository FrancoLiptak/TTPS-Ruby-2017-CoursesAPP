require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "this course must be created" do 
    course = courses(:one)
    assert course.save
  end 

  test "'year' can't be nil" do
    course = courses(:one)
    course.year = nil
    assert_not course.save
  end

  test "'year' must be unique" do
    course = courses(:one)
    course.year = 2020
    course.save
    another_course = courses(:two)
    another_course.year = 2020
    assert_not another_course.save
  end

  test "the course can't be old" do 
    course = courses(:one)
    course.year = 1000
    assert_not course.save
  end
end
