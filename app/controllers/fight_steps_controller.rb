class FightStepsController < ApplicationController
  def show
    @fight = Fight.includes(:fight_steps, :fight_attendances, :fighters).find(params[:fight_id])
    @fighters = @fight.fighters
    steps = @fight.fight_steps
    @step = steps[params[:id].to_i - 1].decorate
    @is_last_step = steps.size == params[:id].to_i
  end
end
