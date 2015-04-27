require 'test_helper'

class CircleUsersControllerTest < ActionController::TestCase
  setup do
    @circle_user = circle_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:circle_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create circle_user" do
    assert_difference('CircleUser.count') do
      post :create, circle_user: { circle_id: @circle_user.circle_id, invite_user_id: @circle_user.invite_user_id, user_id: @circle_user.user_id }
    end

    assert_redirected_to circle_user_path(assigns(:circle_user))
  end

  test "should show circle_user" do
    get :show, id: @circle_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @circle_user
    assert_response :success
  end

  test "should update circle_user" do
    patch :update, id: @circle_user, circle_user: { circle_id: @circle_user.circle_id, invite_user_id: @circle_user.invite_user_id, user_id: @circle_user.user_id }
    assert_redirected_to circle_user_path(assigns(:circle_user))
  end

  test "should destroy circle_user" do
    assert_difference('CircleUser.count', -1) do
      delete :destroy, id: @circle_user
    end

    assert_redirected_to circle_users_path
  end
end
