require 'test_helper'

class ScoresControllerTest < ActionController::TestCase
  setup do
    @evaluation_instances = evaluation_instances(:one)
    @score = scores(:one)
  end

  test "should get index" do
    get :index, params: { evaluation_instances_id: @evaluation_instances }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { evaluation_instances_id: @evaluation_instances }
    assert_response :success
  end

  test "should create score" do
    assert_difference('Score.count') do
      post :create, params: { evaluation_instances_id: @evaluation_instances, score: @score.attributes }
    end

    assert_redirected_to evaluation_instances_score_path(@evaluation_instances, Score.last)
  end

  test "should show score" do
    get :show, params: { evaluation_instances_id: @evaluation_instances, id: @score }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { evaluation_instances_id: @evaluation_instances, id: @score }
    assert_response :success
  end

  test "should update score" do
    put :update, params: { evaluation_instances_id: @evaluation_instances, id: @score, score: @score.attributes }
    assert_redirected_to evaluation_instances_score_path(@evaluation_instances, Score.last)
  end

  test "should destroy score" do
    assert_difference('Score.count', -1) do
      delete :destroy, params: { evaluation_instances_id: @evaluation_instances, id: @score }
    end

    assert_redirected_to evaluation_instances_scores_path(@evaluation_instances)
  end
end
