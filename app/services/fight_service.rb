class FightService
  POINTS_LIMIT = ENV.fetch('POINTS_LIMIT', 10)
  LIFE_POINTS_FACTOR = ENV.fetch('LIFE_POINTS_FACTOR', 10)
  MAX_STEPS_COUNT = ENV.fetch('MAX_STEPS_COUNT', 20)
  FIGHTERS_COUNT_MAX = ENV.fetch('FIGHTERS_COUNT_MAX', 2)

  attr_reader :fight, :fighters

  def initialize(fight:)
    @fight = fight
    @fighters = fight.fighters
    @fighters.each(&:init_stats)
  end

  def start
    steps_count = 0
    while @fighters[0].remaining_life_points.positive? && @fighters[1].remaining_life_points.positive?
      create_step

      steps_count += 1
      break if steps_count > MAX_STEPS_COUNT
    end

    finish
  end

  def finish
    @fight.update_attribute(:state, "finished")

    if @fighters[0].remaining_life_points.positive? && @fighters[1].remaining_life_points <= 0
      winner_index = 0
      loser_index = 1
    elsif @fighters[1].remaining_life_points.positive? && @fighters[0].remaining_life_points <= 0
      winner_index = 1
      loser_index = 0
    else
      return
    end
    @fight.fight_attendances.find_by(fighter_id: @fighters[winner_index]).update_column(:winner, true)
    @fight.fight_attendances.find_by(fighter_id: @fighters[loser_index]).update_column(:loser, true)
    @fighters[winner_index].increment!(:wins_count)
    @fighters[loser_index].increment!(:losses_count)
  end

  private

  JANKEN_HANDS = %w[✊ ✋ ✌️].freeze
  JANKEN_BEATS = {
    "✊" => "✌️",
    "✋" => "✊",
    "✌️" => "✋"
  }.freeze

  def create_step
    fighter1_hand, fighter2_hand = janken_hands_result

    winner = janken_winner(fighter1_hand, fighter2_hand)

    fighter1_damage_points = @fighters[0] == winner || winner.nil? ? 0 : @fighters[1].attack_points
    fighter2_damage_points = @fighters[1] == winner || winner.nil? ? 0 : @fighters[0].attack_points

    FightStep.create(
      fight: @fight,
      hands: [fighter1_hand, fighter2_hand].join(","),
      damage_points: [fighter1_damage_points, fighter2_damage_points].join(","),
      remaining_life_points: [@fighters[0].remaining_life_points, @fighters[1].remaining_life_points].join(",")
    )

    update_life_points(fighter1_damage_points, fighter2_damage_points)
  end

  def update_life_points(*damage_points)
    @fighters[0].remaining_life_points -= damage_points[0]
    @fighters[1].remaining_life_points -= damage_points[1]
  end

  def janken_hands_result
    hand1 = JANKEN_HANDS.sample
    hand2 = JANKEN_HANDS.sample
    [hand1, hand2]
  end

  def janken_winner(hand1, hand2)
    if hand1 == hand2
      nil
    elsif JANKEN_BEATS[hand1] == hand2
      @fighters[0]
    else
      @fighters[1]
    end
  end
end
