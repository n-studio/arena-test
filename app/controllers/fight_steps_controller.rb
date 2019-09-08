class FightStepsController < ApplicationController
  def show
    @fight = Fight.includes(:fight_steps, :fight_attendances, :fighters).find(params[:fight_id])
    @fighters = @fight.fighters
    steps = @fight.fight_steps
    @step = steps[params[:id].to_i - 1]
    @hands = @step.hands.split(",")
    @damage_points = @step.damage_points.split(",").map(&:to_i)
    @remaining_life_points = @step.remaining_life_points.split(",").map(&:to_i)
    @is_last_step = steps.size == params[:id].to_i
    return unless @is_last_step

    @winner = @fight.winner
    @winner = @fight.loser
  end
end
