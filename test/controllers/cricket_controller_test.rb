require 'test_helper'

class CricketControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cricket_index_url
    assert_response :success
  end

end
