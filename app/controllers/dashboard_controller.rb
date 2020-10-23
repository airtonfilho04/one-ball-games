class DashboardController < ApplicationController
  layout false
  # GET /dashboard
  def index
    @games = Game.all
  end

  # GET /dashboard/game/1
  def show
    @game = Game.find(params[:id])
  end

end
