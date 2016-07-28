require 'rails_helper'

RSpec.describe King, type: :model do
  describe 'valid_move?' do
    it 'should return true if moving one square east' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      expect(king.valid_move?(5,0)).to eq true
    end

    it 'should return true if moving one square west' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      expect(king.valid_move?(3,0)).to eq true
    end

    it 'should return true if moving one square north' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 1, game_id: game.id)
      expect(king.valid_move?(4,0)).to eq true
    end

    it 'should return true if moving one square south' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 1, game_id: game.id)
      expect(king.valid_move?(4,2)).to eq true
    end

    it 'should return true if moving one square northeast' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 1, game_id: game.id)
      expect(king.valid_move?(5,0)).to eq true
    end

    it 'should return true if moving one square northwest' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 1, game_id: game.id)
      expect(king.valid_move?(3,0)).to eq true
    end

    it 'should return true if moving one square southwest' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 1, game_id: game.id)
      expect(king.valid_move?(3,2)).to eq true
    end

    it 'should return true if moving one square southeast' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 1, game_id: game.id)
      expect(king.valid_move?(5,2)).to eq true
    end

    it 'should return false if moving more than one square east' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      expect(king.valid_move?(7,0)).to eq false
    end

    it 'should return false if moving more than one square south' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      expect(king.valid_move?(4,5)).to eq false
    end

    it 'should return false if moving more than one square southwest' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      expect(king.valid_move?(0,4)).to eq false
    end

    it 'should return false if moving to a random square on the board' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      expect(king.valid_move?(2,7)).to eq false
    end

    it 'should return false if trying to move off the board' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 0, y_position: 2, game_id: game.id)
      expect(king.valid_move?(-1,8)).to eq false
    end
  end
end
