require "application_system_test_case"

class ArenasTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url

    assert_selector "h3", text: "Waiting for fighters"
  end

  test "running a fight" do
    @fighter1 = fighters(:usa)
    @fighter2 = fighters(:france)
    visit root_url

    find("img.pick-fighter.fighter-#{@fighter1.id}").click
    find("img.pick-fighter.fighter-#{@fighter2.id}").click

    click_on "Start"

    loop do
      click_on "Next"
    rescue Capybara::ElementNotFound, Selenium::WebDriver::Error::StaleElementReferenceError => _e
      break
    end

    click_on "Back to arena"

    assert_text "won against"
  end
end
