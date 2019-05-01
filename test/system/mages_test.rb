require "application_system_test_case"

class MagesTest < ApplicationSystemTestCase
  setup do
    @mage = mages(:one)
  end

  test "visiting the index" do
    visit mages_url
    assert_selector "h1", text: "Mages"
  end

  test "creating a Mage" do
    visit mages_url
    click_on "New Mage"

    fill_in "Name", with: @mage.name
    click_on "Create Mage"

    assert_text "Mage was successfully created"
    click_on "Back"
  end

  test "updating a Mage" do
    visit mages_url
    click_on "Edit", match: :first

    fill_in "Name", with: @mage.name
    click_on "Update Mage"

    assert_text "Mage was successfully updated"
    click_on "Back"
  end

  test "destroying a Mage" do
    visit mages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mage was successfully destroyed"
  end
end
