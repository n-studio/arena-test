require "application_system_test_case"

class FightersTest < ApplicationSystemTestCase
  setup do
    @fighter = fighters(:usa)
  end

  test "visiting the index" do
    visit admin_fighters_url
    assert_selector "h1", text: "Fighters"
  end

  test "creating a Fighter" do
    visit admin_fighters_url
    click_on "New Fighter"

    fill_in "Name", with: ""
    fill_in "Life points", with: "0"
    fill_in "Attack points", with: "0"

    click_on "Create Fighter"

    assert_text "Name can't be blank"
    assert_text "Life points must be greater than"
    assert_text "Attack points must be greater than"

    fill_in "Name", with: "Testname"
    fill_in "Life points", with: "5"
    fill_in "Attack points", with: "6"

    click_on "Create Fighter"

    assert_text "points cannot exceed the limit of"

    fill_in "Attack points", with: "5"

    click_on "Create Fighter"

    assert_text "Testname"
    assert_text "Fighter was successfully created"
  end

  test "updating a Fighter" do
    visit admin_fighters_url
    click_on "Edit", match: :first

    fill_in "Name", with: "Newname"
    fill_in "Life points", with: "2"
    fill_in "Attack points", with: "2"

    click_on "Update Fighter"

    assert_text "Newname"

    assert_text "Fighter was successfully updated"
    click_on "Back"
  end

  test "destroying a Fighter" do
    visit admin_fighters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Fighter was successfully destroyed"
  end
end
