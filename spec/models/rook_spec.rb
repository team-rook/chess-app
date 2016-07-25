require 'rails_helper'

RSpec.describe Rook, type: :model do
  describe 'valid_move?' do
    it 'should return true if moving vertical without path blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 0, y_position: 2, game_id: game.id)
      expect(rook.valid_move?(0,5)).to eq true
    end

    it 'should return true if moving horizontal without path blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 0, y_position: 2, game_id: game.id)
      expect(rook.valid_move?(5,2)).to eq true
    end

    it 'should return false if moving vertical with path blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id)
      pawn = Pawn.create(x_position: 0, y_position: 1, game_id: game.id)
      expect(rook.valid_move?(0,5)).to eq false
    end

    it 'should return false if moving horizontal with path blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 0, y_position: 2, game_id: game.id)
      pawn = Pawn.create(x_position: 2, y_position: 2, game_id: game.id)
      expect(rook.valid_move?(5,2)).to eq false
    end

    it 'should return false if not moving horizontal or vertical' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 0, y_position: 2, game_id: game.id)
      expect(rook.valid_move?(1,3)).to eq false
    end
  end
end
