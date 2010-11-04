require 'test_helper'

class StartControllerTest < ActionController::TestCase
  test "should get slow" do
    get :slow
    assert_response :success
  end

  test "should get fast" do
    get :fast
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
