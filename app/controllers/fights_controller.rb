class FightsController < ApplicationController
  def index
    @fight = Fight.new
    load_fighters
    render :new
  end

  def show
    @fight = Fight.find(params[:id])
    load_fighters
    load_selected_fighters
    render :new
  end

  def create
    @fight = params[:id] ? Fight.find(params[:id]) : Fight.new
    add_fighter
    redirect_to fight_url(@fight)
  end

  def update
    @fight = Fight.find(params[:id])

    if params[:fighter_id]
      add_fighter
      redirect_to fight_url(@fight)
    elsif params[:start] == "true"
      service = FightService.new(fight: @fight)
      service.start
      redirect_to fight_step_url(@fight, 1)
    end
  end

  private

  def add_fighter
    fighter = Fighter.find(params[:fighter_id])
    @fight.add_fighter(fighter)
    @fight.save
  end

  def load_fighters
    @fighters = Fighter.where.not(id: @fight.fighters.ids)
  end

  def load_selected_fighters
    fighters = @fight.fighters.to_a
    @fighter1 = fighters.fetch(0, nil)
    @fighter2 = fighters.fetch(1, nil)
  end
end
