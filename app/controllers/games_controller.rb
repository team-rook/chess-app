class GamesController < ApplicationController
  def new
    @game = Game.new
  end
  
  def show
    @game = Game.find(params[:id])
  end

  def create
		@game = Game.create(game_params)
    redirect_to game_path(@game)
	end

  private

  def game_params
    params.require(:game).permit(:game_name)
  end
end
