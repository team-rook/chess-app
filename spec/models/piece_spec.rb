require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe 'is_obstructed? should work' do
    it 'should return true if a piece is in the horizonal path' do
      a = Piece.create(x_position: 0, y_position: 0, user_id: 0, game_id: 0)
      b = Piece.create(x_position: 1, y_position: 0, user_id: 0, game_id: 0)

      expect(a.is_obstructed?(0,1)
    end
  end
end
