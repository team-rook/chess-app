require 'rails_helper'

RSpec.describe Bishop, type: :model do
  describe 'valid_move?' do
    it 'should return true if moving diagonal without path blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      bishop = Bishop.create(x_position: 2, y_position: 2, game_id: game.id)
      expect(bishop.valid_move?(5,5)).to eq true
    end

    it 'should return false if attempting to move diagonal with path blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      bishop = Bishop.create(x_position: 2, y_position: 2, game_id: game.id)
      pawn = Pawn.create(x_position: 3, y_position: 3, game_id: game.id)
      expect(bishop.valid_move?(5,5)).to eq false
    end

    it 'should return false if not a diagonal move' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      bishop = Bishop.create(x_position: 2, y_position: 2, game_id: game.id)
      expect(bishop.valid_move?(2,5)).to eq false
    end
  end
end
