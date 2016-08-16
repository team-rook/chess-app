require 'rails_helper'

RSpec.describe King, type: :model do
  describe 'king move_to!' do
    it 'should move the correct rook to correct position when castling kingside' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id, user_id: 1 )
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id, user_id: 1)
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id, user_id: 1)
      king.move_to!(6,0)
      expect(game.pieces.where(x_position: 5, y_position: 0).first).to have_attributes(:type => "Rook")
      expect(game.pieces.where(x_position: 7, y_position: 0).first).to be nil
      expect(game.pieces.where(x_position: 0, y_position: 0).first).to have_attributes(:type => "Rook")
    end

    it 'should move the king to correct position when castling kingside' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id, user_id: 1 )
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id, user_id: 1)
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id, user_id: 1)
      king.move_to!(6,0)
      expect(king).to have_attributes(:type => "King", :x_position => 6, :y_position => 0 )
    end

    it 'should move the king to correct position when castling queenside' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id, user_id: 1 )
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id, user_id: 1)
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id, user_id: 1)
      king.move_to!(2,0)
      expect(king).to have_attributes(:type => "King", :x_position => 2, :y_position => 0)
    end

    it 'should move the correct rook to correct position when castling queenside' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id, user_id: 1 )
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id, user_id: 1 )
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id, user_id: 1)
      king.move_to!(2,0)
      expect(game.pieces.where(x_position: 7, y_position: 0).first).to have_attributes(:type => "Rook")
      expect(game.pieces.where(x_position: 0, y_position: 0).first).to be nil
      expect(game.pieces.where(x_position: 3, y_position: 0).first).to have_attributes(:type => "Rook")    end
  end

  describe 'castle!' do
    it 'should move the rook to correct position when castling kingside' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id, user_id: 1 )
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id, user_id: 1 )
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id, user_id: 1)
      king.can_castle?(6,0)
      king.castle!(6,0)
      expect(game.pieces.where(x_position: 5, y_position: 0).first).to have_attributes(:type => "Rook")
    end

    it 'should move the rook to correct position when castling queenside' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id, user_id: 1 )
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id, user_id: 1 )
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id, user_id: 1)
      king.can_castle?(2,0)
      king.castle!(2,0)
      expect(game.pieces.where(x_position: 3, y_position: 0).first).to have_attributes(:type => "Rook")
    end
  end

  describe 'valid_move?' do
     it 'should return true if attempting to castle kingside and can castle' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id, user_id: 1)
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id, user_id: 1 )
      expect(king.valid_move?(6,0)).to eq true
    end

     it 'should return true if attempting to castle queenside and can castle' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id, user_id: 1)
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id, user_id: 1)
      expect(king.valid_move?(2,0)).to eq true
    end

    it 'should return false if attempting to castle kingside and bishop present' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id)
      bishop = Bishop.create(x_position: 5, y_position:0, game_id: game.id)
      expect(king.valid_move?(6,0)).to eq false
    end

    it 'should return false if attempting to castle kingside and knight present' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id)
      knight = Knight.create(x_position: 6, y_position:0, game_id: game.id)
      expect(king.valid_move?(6,0)).to eq false
    end

    it 'should return false if attempting to castle queenside and bishop present' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id)
      bishop = Bishop.create(x_position: 2, y_position:0, game_id: game.id)
      expect(king.valid_move?(2,0)).to eq false
    end

    it 'should return false if attempting to castle queenside and knight present' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id)
      knight = Knight.create(x_position: 1, y_position:0, game_id: game.id)
      expect(king.valid_move?(2,0)).to eq false
    end

    it 'should return false if attempting to castle queenside and queen present' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id, user_id: 1)
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id, user_id: 1)
      queen = Queen.create(x_position: 3, y_position:0, game_id: game.id, user_id: 1)
      expect(king.valid_move?(2,0)).to eq false
    end

    it 'should return false if  attempting to castle kingside and 7 rook has been moved' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id)
      rook.move_to!(6,0)
      rook.move_to!(7,0)
      expect(king.valid_move?(6,0)).to eq false
    end

    it 'should return false if attempting to castle queenside and 0 rook has been moved' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id)
      rook.move_to!(1,0)
      rook.move_to!(0,0)
      expect(king.valid_move?(6,0)).to eq false
    end

    it 'should return false if attempting to castle and king has been moved' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id)
      king.move_to!(3,0)
      king.move_to!(4,0)
      expect(king.valid_move?(6,0)).to eq false
    end

    it 'should return false if attempting to move 2 squares south' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 0, game_id: game.id)
      expect(king.valid_move?(4,2)).to eq false
    end

    it 'should return false if attempting to move 2 squares north' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 7, game_id: game.id)
      expect(king.valid_move?(4,5)).to eq false
    end

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

    it 'should return false if move would put king in check' do
      white_user = FactoryGirl.create(:user)
      black_user = FactoryGirl.create(:user)
      game = Game.create(white_user_id: white_user.id, black_user_id: black_user.id, move_counter: 1)
      king = King.create(x_position: 1, y_position: 7, user_id: black_user.id, game_id: game.id)
      King.create(x_position: 0, y_position: 5, user_id: white_user.id, game_id: game.id)
      Rook.create(x_position: 2, y_position: 7, user_id: white_user.id, game_id: game.id)
      expect(king.valid_move?(0,7)).to eq false
    end
  end
end
