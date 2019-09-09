class FightsController < ApplicationController
  def index
    @fight = Fight.new
    load_fighters
    @selected_fighters = []
    load_latest_fights

    render :new
  end

  def show
    @fight = Fight.find(params[:id])
    load_fighters
    load_selected_fighters
    load_latest_fights

    render :new
  end

  def create
    @fight = params[:id] ? Fight.find(params[:id]) : Fight.new
    add_fighter!
    @fight.save!

    redirect_to fight_url(@fight)
  end

  def update
    @fight = Fight.find(params[:id])
    if params[:fighter_id]
      add_fighter!

      redirect_to fight_url(@fight)
    elsif params[:start] == "true"
      start
    end
  end

  def start
    service = FightService.new(fight: @fight)
    service.start

    redirect_to fight_step_url(@fight, 1)
  end

  def destroy
    @fight = Fight.find(params[:id])
    @fight.destroy! if @fight.fight_steps.count.zero?

    redirect_to root_url
  end

  private

  def add_fighter!
    fighter = Fighter.find(params[:fighter_id])
    @fight.add_fighter(fighter)
  end

  def load_fighters
    @fighters = Fighter.where.not(id: @fight.fighters.ids)
  end

  def load_selected_fighters
    @selected_fighters = @fight.fighters.to_a
    @fighter1 = @selected_fighters.fetch(0, nil)
    @fighter2 = @selected_fighters.fetch(1, nil)
  end

  def load_latest_fights
    @latest_fights = Fight.includes(:fight_attendances, :fighters)
                          .finished
                          .order("updated_at DESC")
                          .first(10)
  end
end
