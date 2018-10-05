require 'test_helper'

class ShorteningUrlControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shortening_url_create_url
    assert_response :success
  end

end
