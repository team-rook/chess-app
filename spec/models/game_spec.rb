require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'find_piece should work' do
    it 'should return the piece that is on the specified (x_position, y_position)' do
      a = Piece.create(x_position: 0, y_position: 0, user_id: 0, game_id: 0)
      expect(Game.pieces.find_piece(0,0).to eq(a)
    end
  end
end
