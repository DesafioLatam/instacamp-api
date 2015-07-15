require 'test_helper'

class CapturesControllerTest < ActionController::TestCase
  setup do
    @capture = captures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:captures)
  end

  test "should create capture" do
    assert_difference('Capture.count') do
      post :create, capture: { comment: @capture.comment, photo: @capture.photo }
    end

    assert_response 201
  end

  test "should show capture" do
    get :show, id: @capture
    assert_response :success
  end

  test "should update capture" do
    put :update, id: @capture, capture: { comment: @capture.comment, photo: @capture.photo }
    assert_response 204
  end

  test "should destroy capture" do
    assert_difference('Capture.count', -1) do
      delete :destroy, id: @capture
    end

    assert_response 204
  end
end
