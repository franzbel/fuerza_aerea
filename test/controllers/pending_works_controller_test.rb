require 'test_helper'

class PendingWorksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get update_components" do
    get :update_components
    assert_response :success
  end

end
