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
end
