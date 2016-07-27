class GamesController < ApplicationController
before_action :authenticate_user!, only: [:new, :join, :create]

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

  def join
    @game = Game.find(params[:id])
    if @game.black_user.nil? && current_user != @game.white_user
      @game.add_black_player(current_user)
      flash[:notice]="You've joined as the Black Player!"
      redirect_to game_path(@game)
   else
    flash[:alert] = "You've already joined the game"
    redirect_to game_path
    
  end
  end

  private

  def game_params
    params.require(:game).permit(:game_name, :white_user_id, :black_user_id)
  end
end
