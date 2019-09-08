class FightStepDecorator < Draper::Decorator
  def hands
    object.hands.split(",")
  end

  def damage_points
    object.damage_points.split(",").map(&:to_i)
  end

  def remaining_life_points
    object.remaining_life_points.split(",").map(&:to_i)
  end
end
