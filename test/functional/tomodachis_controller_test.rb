require 'test_helper'

class TomodachisControllerTest < ActionController::TestCase
  setup do
    @tomodachi = tomodachis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tomodachis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tomodachi" do
    assert_difference('Tomodachi.count') do
      post :create, tomodachi: { email: @tomodachi.email, name: @tomodachi.name }
    end

    assert_redirected_to tomodachi_path(assigns(:tomodachi))
  end

  test "should show tomodachi" do
    get :show, id: @tomodachi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tomodachi
    assert_response :success
  end

  test "should update tomodachi" do
    put :update, id: @tomodachi, tomodachi: { email: @tomodachi.email, name: @tomodachi.name }
    assert_redirected_to tomodachi_path(assigns(:tomodachi))
  end

  test "should destroy tomodachi" do
    assert_difference('Tomodachi.count', -1) do
      delete :destroy, id: @tomodachi
    end

    assert_redirected_to tomodachis_path
  end
end
