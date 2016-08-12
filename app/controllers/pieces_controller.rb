class PiecesController < ApplicationController
	def update
	  @piece = Piece.find(params[:id])
		x = params[:x_position].to_i
		y = params[:y_position].to_i

		if @piece.user_id != current_user.id
			return render text: 'not your turn', status: :unauthorized
		end

		if @piece.user_id == current_user.id
			if @piece.move_to!(x,y)
				return render json: 'success'
			end
		render json: 'failure'
		end
	end

	private

	def piece_params
		params.require(:piece).permit(:game_id, :user_id, :type, :x_position, :y_position, :captured)
	end
end
