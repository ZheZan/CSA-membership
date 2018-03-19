require 'test_helper'

class DynastiesControllerTest < ActionController::TestCase
  setup do
    @dynasty = dynasties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dynasties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dynasty" do
    assert_difference('Dynasty.count') do
      post :create, dynasty: { name: @dynasty.name }
    end

    assert_redirected_to dynasty_path(assigns(:dynasty))
  end

  test "should show dynasty" do
    get :show, id: @dynasty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dynasty
    assert_response :success
  end

  test "should update dynasty" do
    patch :update, id: @dynasty, dynasty: { name: @dynasty.name }
    assert_redirected_to dynasty_path(assigns(:dynasty))
  end

  test "should destroy dynasty" do
    assert_difference('Dynasty.count', -1) do
      delete :destroy, id: @dynasty
    end

    assert_redirected_to dynasties_path
  end
end
