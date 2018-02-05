require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  # --- Test for validations ---

  test "'year' can't be nil" do
    assert_not Course.new.valid?
  end

  test "'year' must be unique" do
    assert_not Course.new(year: 2017).valid? # see ../test/fixtures/courses.yml
  end

  test "you can not create a course more than 5 years ago" do
    assert_not Course.new(year: 2012).valid?
  end

  test "you can not create a course for 5 years + from now" do 
    assert_not Course.new(year: 2024).valid?
  end

  # --- tests for methods isn't necessary ---

end
