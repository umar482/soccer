class GameController < ApplicationController
  def index
    @games = Game.all
  end

  def update
    @game = Game.find(params[:id])
    @game.update(minutes_bought: params[:minutes_bought])
  end

  private 

  def game_params
    params.require(:game).(:home_team_name, :away_team_name, :date, :reach, :channel, :league, :price_per_minute, :minutes_bought)
  end
end
