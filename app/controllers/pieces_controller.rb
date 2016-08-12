class PiecesController < ApplicationController
	def update
	  @piece = Piece.find(params[:id])
		x = params[:x_position].to_i
		y = params[:y_position].to_i
	  @game = @piece.game

		if @piece.user_id == current_user.id
			if @piece.move_to!(x,y)
				render json: 'success'
			else
				render json: 'failure'
			end
		end
	end

	private

	def piece_params
		params.require(:piece).permit(:game_id, :user_id, :type, :x_position, :y_position, :captured)
	end
end
