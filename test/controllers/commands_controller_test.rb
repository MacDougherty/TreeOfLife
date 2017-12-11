require 'test_helper'

class CommandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commands_index_url
    assert_response :success
  end

  test "should get update" do
    get commands_update_url
    assert_response :success
  end

end
