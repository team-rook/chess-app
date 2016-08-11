class PiecesController < ApplicationController
	def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    @piece.move_to!(piece_params)
	end

	private

	def piece_params
		params.require(:piece).permit(:game_id, :user_id, :type, :x_position, :y_position)
	end
end
