require 'test_helper'

class Admin::FightersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fighter = fighters(:usa)
  end

  test "should get index" do
    get admin_fighters_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_fighter_url
    assert_response :success
  end

  test "should create fighter" do
    assert_difference('Fighter.count') do
      post admin_fighters_url, params: {
        fighter: { name: "Fighter name", life_points: 5, attack_points: 5 }
      }
    end

    assert_redirected_to admin_fighter_url(Fighter.last)
  end

  test "should show fighter" do
    get admin_fighter_url(@fighter)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_fighter_url(@fighter)
    assert_response :success
  end

  test "should update fighter" do
    patch admin_fighter_url(@fighter), params: {
      fighter: { name: "New fighter name", life_points: 2, attack_points: 8 }
    }
    assert_redirected_to admin_fighter_url(@fighter)
  end

  test "should destroy fighter" do
    assert_difference('Fighter.count', -1) do
      delete admin_fighter_url(@fighter)
    end

    assert_redirected_to admin_fighters_url
  end
end
