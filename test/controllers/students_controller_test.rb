require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @courses = courses(:one)
    @student = students(:one)
  end

  test "should get index" do
    get :index, params: { courses_id: @courses }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { courses_id: @courses }
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, params: { courses_id: @courses, student: @student.attributes }
    end

    assert_redirected_to courses_student_path(@courses, Student.last)
  end

  test "should show student" do
    get :show, params: { courses_id: @courses, id: @student }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { courses_id: @courses, id: @student }
    assert_response :success
  end

  test "should update student" do
    put :update, params: { courses_id: @courses, id: @student, student: @student.attributes }
    assert_redirected_to courses_student_path(@courses, Student.last)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, params: { courses_id: @courses, id: @student }
    end

    assert_redirected_to courses_students_path(@courses)
  end
end
