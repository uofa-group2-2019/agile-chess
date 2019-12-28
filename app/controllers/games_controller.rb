class GamesController < ApplicationController
  def index
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(params.require(:game).permit(:name))
    redirect_to user_path(@game.user)
  end

  def show
  end
end
