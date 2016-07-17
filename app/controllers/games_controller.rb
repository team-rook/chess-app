class GamesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.create(game_params)
    @game.white_user = current_user
    @game.save
    redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(:game_name, :white_user_id, :black_user_id)
  end
end
