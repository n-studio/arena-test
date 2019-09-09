require 'test_helper'

class FightServiceTest < ActiveSupport::TestCase
  test "the fight records the steps" do
    fighter1 = fighters(:usa)
    fighter2 = fighters(:france)

    fight = Fight.create(fighters: [fighter1, fighter2])
    service = FightService.new(fight: fight)

    # Bribe fighter2 to lose
    service.fighters[1].attack_points = 0

    assert_changes "FightStep.count" do
      assert_difference -> { service.fighters[0].wins_count } do
        assert_difference -> { service.fighters[1].losses_count } do
          FightService.stub_const(:MAX_STEPS_COUNT, 100) do
            service.start
          end
        end
      end
    end

    assert service.fighters[1].remaining_life_points.negative?, "Fighter 2 shouldn't have remaining life points"
    assert_equal service.fighters[0].id, service.fight.winner.id
    assert_equal service.fighters[1].id, service.fight.loser.id
    assert_equal "finished", service.fight.state
    assert_equal Fight.finished.last.id, service.fight.id
  end

  test "the fight ends with a draw" do
    fighter1 = fighters(:usa)
    fighter2 = fighters(:france)

    fight = Fight.create(fighters: [fighter1, fighter2])
    service = FightService.new(fight: fight)

    # No one attacks
    service.fighters[0].attack_points = 0
    service.fighters[1].attack_points = 0

    assert_no_difference -> { service.fighters[0].wins_count } do
      assert_no_difference -> { service.fighters[1].losses_count } do
        FightService.stub_const(:MAX_STEPS_COUNT, 1) do
          service.start
        end
      end
    end

    assert service.fighters[1].remaining_life_points.positive?
    assert_nil service.fight.winner
    assert_nil service.fight.loser
    assert_equal "finished", service.fight.state
  end
end
