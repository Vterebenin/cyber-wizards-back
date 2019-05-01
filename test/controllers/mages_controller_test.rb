require 'test_helper'

class MagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mage = mages(:one)
  end

  test "should get index" do
    get mages_url
    assert_response :success
  end

  test "should get new" do
    get new_mage_url
    assert_response :success
  end

  test "should create mage" do
    assert_difference('Mage.count') do
      post mages_url, params: { mage: { name: @mage.name } }
    end

    assert_redirected_to mage_url(Mage.last)
  end

  test "should show mage" do
    get mage_url(@mage)
    assert_response :success
  end

  test "should get edit" do
    get edit_mage_url(@mage)
    assert_response :success
  end

  test "should update mage" do
    patch mage_url(@mage), params: { mage: { name: @mage.name } }
    assert_redirected_to mage_url(@mage)
  end

  test "should destroy mage" do
    assert_difference('Mage.count', -1) do
      delete mage_url(@mage)
    end

    assert_redirected_to mages_url
  end
end
