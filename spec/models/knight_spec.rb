require 'rails_helper'

RSpec.describe Knight, type: :model do
  describe 'valid_move?' do
    it 'should return true if moving two squares north and one square east' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      knight = Knight.create(x_position: 2, y_position: 5, game_id: game.id)
      expect(knight.valid_move?(3,3)).to eq true
    end

    it 'should return true if moving two squares north and one square west' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      knight = Knight.create(x_position: 2, y_position: 5, game_id: game.id)
      expect(knight.valid_move?(1,3)).to eq true
    end

    it 'should return true if moving two squares south and one square east' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      knight = Knight.create(x_position: 1, y_position: 3, game_id: game.id)
      expect(knight.valid_move?(2,5)).to eq true
    end

    it 'should return true if moving two squares west and one square south' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      knight = Knight.create(x_position: 3, y_position: 3, game_id: game.id)
      expect(knight.valid_move?(1,4)).to eq true
    end

    it 'should return true if moving two squares east and one square north' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      knight = Knight.create(x_position: 3, y_position: 3, game_id: game.id)
      expect(knight.valid_move?(5,2)).to eq true
    end

    it 'should return false if moving to a random square' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      knight = Knight.create(x_position: 3, y_position: 3, game_id: game.id)
      expect(knight.valid_move?(6,5)).to eq false
    end
  end
end
