require 'test_helper'

class FollowingsControllerTest < ActionController::TestCase
  test "should get follow" do
    get :follow
    assert_response :success
  end

end
