require 'test_helper'

class PointRulesControllerTest < ActionController::TestCase
  setup do
    @point_rule = point_rules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:point_rules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create point_rule" do
    assert_difference('PointRule.count') do
      post :create, point_rule: { name: @point_rule.name, score: @point_rule.score }
    end

    assert_redirected_to point_rule_path(assigns(:point_rule))
  end

  test "should show point_rule" do
    get :show, id: @point_rule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @point_rule
    assert_response :success
  end

  test "should update point_rule" do
    patch :update, id: @point_rule, point_rule: { name: @point_rule.name, score: @point_rule.score }
    assert_redirected_to point_rule_path(assigns(:point_rule))
  end

  test "should destroy point_rule" do
    assert_difference('PointRule.count', -1) do
      delete :destroy, id: @point_rule
    end

    assert_redirected_to point_rules_path
  end
end
