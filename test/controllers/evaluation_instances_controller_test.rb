require 'test_helper'

class EvaluationInstancesControllerTest < ActionController::TestCase
  setup do
    @courses = courses(:one)
    @evaluation_instance = evaluation_instances(:one)
  end

  test "should get index" do
    get :index, params: { courses_id: @courses }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { courses_id: @courses }
    assert_response :success
  end

  test "should create evaluation_instance" do
    assert_difference('EvaluationInstance.count') do
      post :create, params: { courses_id: @courses, evaluation_instance: @evaluation_instance.attributes }
    end

    assert_redirected_to courses_evaluation_instance_path(@courses, EvaluationInstance.last)
  end

  test "should show evaluation_instance" do
    get :show, params: { courses_id: @courses, id: @evaluation_instance }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { courses_id: @courses, id: @evaluation_instance }
    assert_response :success
  end

  test "should update evaluation_instance" do
    put :update, params: { courses_id: @courses, id: @evaluation_instance, evaluation_instance: @evaluation_instance.attributes }
    assert_redirected_to courses_evaluation_instance_path(@courses, EvaluationInstance.last)
  end

  test "should destroy evaluation_instance" do
    assert_difference('EvaluationInstance.count', -1) do
      delete :destroy, params: { courses_id: @courses, id: @evaluation_instance }
    end

    assert_redirected_to courses_evaluation_instances_path(@courses)
  end
end
