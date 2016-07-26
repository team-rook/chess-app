require 'rails_helper'

RSpec.describe Queen, type: :model do
  describe 'valid_move?' do
    it 'should return true if moving horizontal with path clear' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      queen = Queen.create(x_position: 3, y_position: 2, game_id: game.id)
      expect(queen.valid_move?(7,2)).to eq true
    end

    it 'should return true if moving vertical with path clear' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      queen = Queen.create(x_position: 3, y_position: 2, game_id: game.id)
      expect(queen.valid_move?(3,5)).to eq true
    end

    it 'should return true if moving diagonal with path clear' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      queen = Queen.create(x_position: 3, y_position: 2, game_id: game.id)
      expect(queen.valid_move?(0,5)).to eq true
    end

    it 'should return false if moving with path blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      queen = Queen.create(x_position: 3, y_position: 0, game_id: game.id)
      pawn = Pawn.create(x_position: 3, y_position: 1, game_id: game.id)
      expect(queen.valid_move?(3,2)).to eq false
    end

    it 'should return false if not moving horizontal, vertical, or diagonal' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      queen = Queen.create(x_position: 3, y_position: 0, game_id: game.id)
      expect(queen.valid_move?(4,5)).to eq false
    end
  end
end
