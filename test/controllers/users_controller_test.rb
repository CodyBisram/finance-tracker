require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_portoflio" do
    get users_my_portoflio_url
    assert_response :success
  end
end
