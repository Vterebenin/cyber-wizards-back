require 'test_helper'

class FightFieldControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get fight_field_show_url
    assert_response :success
  end

end
