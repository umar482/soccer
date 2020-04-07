class GamesController < ApplicationController
  def index
    @games = Game.all.order("RANDOM()")
    respond_to do |format|
      format.html
      format.json { render json: @games }
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.update(minutes_bought: params[:minutes_bought])
    respond_to do |format|
      format.html
      format.json { render json: @game }
    end
  end

  private 

  def game_params
    params.require(:game).(:home_team_name, :away_team_name, :date, :reach, :channel, :league, :price_per_minute, :minutes_bought)
  end
end
