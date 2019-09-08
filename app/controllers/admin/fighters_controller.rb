class Admin::FightersController < ApplicationController
  before_action :set_fighter, only: %i[show edit update destroy]

  # GET /fighters
  # GET /fighters.json
  def index
    @fighters = Fighter.all
  end

  # GET /fighters/1
  # GET /fighters/1.json
  def show; end

  # GET /fighters/new
  def new
    @fighter = Fighter.new
  end

  # GET /fighters/1/edit
  def edit; end

  # POST /fighters
  # POST /fighters.json
  def create
    @fighter = Fighter.new(fighter_params)

    respond_to do |format|
      if @fighter.save
        format.html { redirect_to admin_fighters_path, notice: 'Fighter was successfully created.' }
        format.json { head :ok }
      else
        format.html { render :new }
        format.json { render json: @fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fighters/1
  # PATCH/PUT /fighters/1.json
  def update
    respond_to do |format|
      if @fighter.update(fighter_params)
        format.html { redirect_to admin_fighters_path, notice: 'Fighter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :edit }
        format.json { render json: @fighter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fighters/1
  # DELETE /fighters/1.json
  def destroy
    @fighter.destroy
    respond_to do |format|
      format.html { redirect_to admin_fighters_url, notice: 'Fighter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_fighter
    @fighter = Fighter.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def fighter_params
    params.require(:fighter).permit(:name, :life_points, :attack_points)
  end
end
