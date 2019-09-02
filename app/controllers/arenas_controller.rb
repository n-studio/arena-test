class ArenasController < ApplicationController
  def index
    @fighters = Fighter.all
  end
end
