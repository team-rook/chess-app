class GamesController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]

  def index
    @games = Game.where(black_user_id: [nil])
  end

  def new
    @game = Game.new
  end
  
  def show
    @game = Game.find(params[:id])
  end

  def create
	@game = current_user.games.create(game_params)
     redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(:game_name)
  end
end
