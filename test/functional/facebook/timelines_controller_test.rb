require 'test_helper'

class Facebook::TimelinesControllerTest < ActionController::TestCase
  setup do
    @facebook_timeline = facebook_timelines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:facebook_timelines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create facebook_timeline" do
    assert_difference('Facebook::Timeline.count') do
      post :create, facebook_timeline: {  }
    end

    assert_redirected_to facebook_timeline_path(assigns(:facebook_timeline))
  end

  test "should show facebook_timeline" do
    get :show, id: @facebook_timeline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @facebook_timeline
    assert_response :success
  end

  test "should update facebook_timeline" do
    put :update, id: @facebook_timeline, facebook_timeline: {  }
    assert_redirected_to facebook_timeline_path(assigns(:facebook_timeline))
  end

  test "should destroy facebook_timeline" do
    assert_difference('Facebook::Timeline.count', -1) do
      delete :destroy, id: @facebook_timeline
    end

    assert_redirected_to facebook_timelines_path
  end
end
