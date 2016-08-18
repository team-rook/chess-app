class PiecesController < ApplicationController
	def show
		@piece = Piece.find(params[:id])
	end

	def update
	  @piece = Piece.find(params[:id])
		x = params[:x_position].to_i
		y = params[:y_position].to_i

		if @piece.user_id != current_user.id
			return render json: {success: false }
		end

		if @piece.user_id == current_user.id
			if @piece.move_to!(x,y)
				respond_to do |format|
					format.html { render :show }
					format.json { render json: { success: true, current_player: @piece.game.current_player == @piece.game.black_player ? 'black' : 'white' } @piece, status: :ok }
				end
			else
				render json: {success: false }
			end
		end
	end

	private

	def piece_params
		params.require(:piece).permit(:game_id, :user_id, :type, :x_position, :y_position, :captured)
	end
end
