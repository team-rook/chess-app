require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'active_player' do
    it 'should return the white user when the move counter is even' do
      white_user = FactoryGirl.create(:user)
      black_user = FactoryGirl.create(:user)
      game = Game.create(white_user_id: white_user.id, black_user_id: black_user.id, move_counter: 0)
      expect(game.active_player).to eq white_user
    end

    it 'should return the black user when the move counter is odd' do
      white_user = FactoryGirl.create(:user)
      black_user = FactoryGirl.create(:user)
      game = Game.create(white_user_id: white_user.id, black_user_id: black_user.id, move_counter: 1)
      expect(game.active_player).to eq black_user
    end
  end

  describe 'initialize_board!' do
    it 'should have correct number of pieces' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      game.initialize_board!
      expect(game.pieces.count).to eq (32)
    end
  end

  describe 'find_piece' do
    it 'should return a piece object for the input x,y coordinate' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      black_rook = Rook.create(x_position: 0, y_position: 0, user_id: 1, game_id: game.id)
      expect(game.find_piece(0,0)).to eq black_rook
    end
  end

  describe 'square_occupied?' do
    it 'should return true if the space is occupied by a piece' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      black_rook = Rook.create(x_position: 0, y_position: 0, user_id: 1, game_id: game.id)
      expect(game.square_occupied?(0,0)).to eq true
    end
  end

  describe 'check?' do
    it 'should return true if the active players king is threatened' do
      white_user = FactoryGirl.create(:user)
      black_user = FactoryGirl.create(:user)
      game = Game.create(white_user_id: white_user.id, black_user_id: black_user.id, move_counter: 1)
      King.create(x_position: 0, y_position: 7, user_id: black_user.id, game_id: game.id)
      King.create(x_position: 0, y_position: 5, user_id: white_user.id, game_id: game.id)
      Rook.create(x_position: 2, y_position: 7, user_id: white_user.id, game_id: game.id)
      expect(game.check?).to eq true
    end

    it 'should return false if the active players king is not threatened' do
      white_user = FactoryGirl.create(:user)
      black_user = FactoryGirl.create(:user)
      game = Game.create(white_user_id: white_user.id, black_user_id: black_user.id)
      game.initialize_board!
      expect(game.check?).to eq false
    end
  end
end
