class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  private

  def place_params
    params.require(:game).permit(:name)
  end
end
