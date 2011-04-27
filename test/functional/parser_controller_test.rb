require 'test_helper'

class ParserControllerTest < ActionController::TestCase
  test "should get exec" do
    get :exec
    assert_response :success
  end

end
