require 'test_helper'

class CircleFeedsControllerTest < ActionController::TestCase
  setup do
    @circle_feed = circle_feeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:circle_feeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create circle_feed" do
    assert_difference('CircleFeed.count') do
      post :create, circle_feed: { circle_id: @circle_feed.circle_id, feed_id: @circle_feed.feed_id, user_id: @circle_feed.user_id }
    end

    assert_redirected_to circle_feed_path(assigns(:circle_feed))
  end

  test "should show circle_feed" do
    get :show, id: @circle_feed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @circle_feed
    assert_response :success
  end

  test "should update circle_feed" do
    patch :update, id: @circle_feed, circle_feed: { circle_id: @circle_feed.circle_id, feed_id: @circle_feed.feed_id, user_id: @circle_feed.user_id }
    assert_redirected_to circle_feed_path(assigns(:circle_feed))
  end

  test "should destroy circle_feed" do
    assert_difference('CircleFeed.count', -1) do
      delete :destroy, id: @circle_feed
    end

    assert_redirected_to circle_feeds_path
  end
end
