module FightStepsHelper
  def attack_description(damage_points)
    if damage_points == [0, 0]
      "DRAW"
    elsif damage_points[1].positive?
      raw "ATTACK -&gt;"
    else
      raw "&lt;- ATTACK"
    end
  end

  def damage_description(fighter, damage_points)
    string = "#{fighter.name}<br>"
    string += damage_points.positive? ? "loses #{damage_points} points!" : "attacks!"
    raw string
  end

  def render_action(fighters:, step:, fighter_index:, position: :left)
    render partial: "action", locals: { fighter: fighters[fighter_index],
                                        hand: step.hands[fighter_index],
                                        damage_points: step.damage_points[fighter_index],
                                        remaining_life_points: step.remaining_life_points[fighter_index],
                                        position: position }
  end
end
