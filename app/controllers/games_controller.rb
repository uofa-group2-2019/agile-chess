class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :index]

  def index
    @unmatched_games = Game.where(:white_player_user_id => nil).where.not(:black_player_user_id => nil) or (Game.where.not(:white_player_user_id => nil).where(:black_player_user_id => nil))
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    redirect_to game_path(@game)
  end

  def show
  end

  def update
    @game = Game.find_by_id(params[:game_id])
    @game.update_attributes game_params
    redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(:name, :white_player_user_id, :black_player_user_id)
  end
end