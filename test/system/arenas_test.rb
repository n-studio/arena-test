require "application_system_test_case"

class ArenasTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url

    assert_selector "h3", text: "Waiting for fighters"
  end
end
