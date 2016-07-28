require 'rails_helper'

RSpec.describe Piece, type: :model do
  describe 'horizontal?' do
    it 'should return true if piece is moving horizontally east' do
      rook = Rook.create(x_position: 0, y_position: 0)
      expect(rook.horizontal?(7,0)).to eq true
    end

    it 'should return true if piece is moving horizontally west' do
      rook = Rook.create(x_position: 7, y_position: 0)
      expect(rook.horizontal?(2,0)).to eq true
    end

    it 'should return false if not horizontal move' do
      rook = Rook.create(x_position: 0, y_position: 0)
      expect(rook.horizontal?(0,4)).to eq false
    end
  end

  describe 'vertical?' do
    it 'should return true if the piece is moving vertically north' do
      rook = Rook.create(x_position: 0, y_position: 7)
      expect(rook.vertical?(0,5)).to eq true
    end

    it 'should return true if the piece is moving vertically south' do
      rook = Rook.create(x_position: 0, y_position: 0)
      expect(rook.vertical?(0,5)).to eq true
    end

    it 'should return false if not vertical move' do
      rook = Rook.create(x_position: 0, y_position: 0)
      expect(rook.vertical?(7,0)).to eq false
    end
  end

  describe 'diagonal?' do
    it 'should return true if the piece is moving diagonally southeast' do
      bishop = Bishop.create(x_position: 2, y_position: 0)
      expect(bishop.diagonal?(4,2)).to eq true
    end

    it 'should return true if the piece is moving diagonally southwest' do
      bishop = Bishop.create(x_position: 2, y_position: 0)
      expect(bishop.diagonal?(0,2)).to eq true
    end

    it 'should return true if the piece is moving diagonally northwest' do
      bishop = Bishop.create(x_position: 5, y_position: 7)
      expect(bishop.diagonal?(7,5)).to eq true
    end

    it 'should return true if the piece is moving diagonally northeast' do
      bishop = Bishop.create(x_position: 5, y_position: 7)
      expect(bishop.diagonal?(2,4)).to eq true
    end

    it 'should return false if not diagonal move' do
      bishop = Bishop.create(x_position: 5, y_position: 7)
      expect(bishop.diagonal?(5,4)).to eq false
    end
  end

  describe 'horizontal_blocked?' do
    it 'should return true if the horizontal path east is blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id)
      queen = Queen.create(x_position: 3, y_position: 0, game_id: game.id)
      expect(rook.horizontal_blocked?(4,0)).to eq true
    end

    it 'should return false if the horizontal path east is clear' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 0, y_position: 2, game_id: game.id)
      expect(rook.horizontal_blocked?(3,2)).to eq false
    end

    it 'should return true if the horizontal path west is blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 7, y_position: 0, game_id: game.id)
      queen = Queen.create(x_position: 3, y_position: 0, game_id: game.id)
      expect(rook.horizontal_blocked?(2,0)).to eq true
    end

    it 'should return false if the horizontal path west is clear' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 2, y_position: 2, game_id: game.id)
      expect(rook.horizontal_blocked?(0,2)).to eq false
    end

    it 'should return false even if destination square is occupied because checking path only' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 0, y_position: 3, game_id: game.id)
      pawn = Pawn.create(x_position: 3, y_position: 3, game_id: game.id)
      expect(rook.vertical_blocked?(3,3)).to eq false
    end
  end

  describe 'vertical_blocked?' do
    it 'should return true if the vertical path north is blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 3, y_position: 3, game_id: game.id)
      pawn = Pawn.create(x_position: 3, y_position: 1, game_id: game.id)
      expect(rook.vertical_blocked?(3,0)).to eq true
    end

    it 'should return false if the vertical path north is clear' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 3, y_position: 5, game_id: game.id)
      expect(rook.vertical_blocked?(3,2)).to eq false
    end

    it 'should return true if the vertical path south is blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 0, y_position:0, game_id: game.id)
      pawn = Pawn.create(x_position: 0, y_position: 1, game_id: game.id)
      expect(rook.vertical_blocked?(0,3)).to eq true
    end

    it 'should return false if the vertical path south is clear' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 3, y_position: 3, game_id: game.id)
      expect(rook.vertical_blocked?(3,5)).to eq false
    end

    it 'should return false even if destination square is occupied because checking path only' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 3, y_position: 3, game_id: game.id)
      pawn = Pawn.create(x_position: 3, y_position: 6, game_id: game.id)
      expect(rook.vertical_blocked?(3,6)).to eq false
    end
  end

  describe 'diagonal_blocked?' do
    it 'should return true if the diagonal path northeast is blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      bishop = Bishop.create(x_position: 5, y_position: 7, game_id: game.id)
      pawn = Pawn.create(x_position: 6, y_position: 6, game_id: game.id)
      expect(bishop.diagonal_blocked?(7,5)).to eq true
    end

    it 'should return true if the diagonal path northwest is blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      bishop = Bishop.create(x_position: 5, y_position: 7, game_id: game.id)
      pawn = Pawn.create(x_position: 4, y_position: 6, game_id: game.id)
      expect(bishop.diagonal_blocked?(3,5)).to eq true
    end

    it 'should return true if the diagonal path southwest is blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      bishop = Bishop.create(x_position: 2, y_position: 0, game_id: game.id)
      pawn = Pawn.create(x_position: 1, y_position: 1, game_id: game.id)
      expect(bishop.diagonal_blocked?(0,2)).to eq true
    end

    it 'should return true if the diagonal path southeast is blocked' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      bishop = Bishop.create(x_position: 2, y_position: 0, game_id: game.id)
      pawn = Pawn.create(x_position: 3, y_position: 1, game_id: game.id)
      expect(bishop.diagonal_blocked?(4,2)).to eq true
    end

    it 'should return false if the diagonal path is clear' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      bishop = Bishop.create(x_position: 2, y_position: 2, game_id: game.id)
      expect(bishop.diagonal_blocked?(5,5)).to eq false
    end

    it 'should return false even if destination square is occupied because checking path only' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      bishop = Bishop.create(x_position: 2, y_position: 0, game_id: game.id)
      pawn = Pawn.create(x_position: 3, y_position: 1, game_id: game.id)
      expect(bishop.diagonal_blocked?(3,1)).to eq false
    end
  end

  describe 'path_blocked?' do
    it 'should return true if the path is blocked for horizontal move' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 0, y_position: 0, game_id: game.id)
      queen = Queen.create(x_position: 3, y_position: 0, game_id: game.id)
      expect(rook.path_blocked?(4,0)).to eq true
    end

    it 'should return false if the path is clear for horizontal move' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 0, y_position: 2, game_id: game.id)
      expect(rook.horizontal_blocked?(3,2)).to eq false
    end

    it 'should return true if the path is blocked for vertical move' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 3, y_position: 3, game_id: game.id)
      pawn = Pawn.create(x_position: 3, y_position: 1, game_id: game.id)
      expect(rook.path_blocked?(3,0)).to eq true
    end

    it 'should return false if the path is clear for horizontal move' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      rook = Rook.create(x_position: 3, y_position: 3, game_id: game.id)
      expect(rook.vertical_blocked?(3,5)).to eq false
    end

    it 'should return true if the path is blocked for diagonal move' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      bishop = Bishop.create(x_position: 5, y_position: 7, game_id: game.id)
      pawn = Pawn.create(x_position: 6, y_position: 6, game_id: game.id)
      expect(bishop.path_blocked?(7,5)).to eq true
    end

    it 'should return false if the path is clear for diagonal move' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      bishop = Bishop.create(x_position: 2, y_position: 2, game_id: game.id)
      expect(bishop.path_blocked?(5,5)).to eq false
    end
  end

  describe 'move_to!' do
    it 'should move the piece to the destination square' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      king = King.create(x_position: 4, y_position: 2, game_id: game.id)
      king.move_to!(4,3)
      expect(king.x_position).to eq 4
      expect(king.y_position).to eq 3
    end

    # it 'should move the piece to the destination square; if the square is occupied, mark that piece as captured' do
    #   game = Game.create(white_user_id: 0, black_user_id: 1)
    #   king = King.create(x_position: 4, y_position: 2, game_id: game.id)
    #   rook = Rook.create(x_position: 4, y_position: 3, game_id: game.id)
    #   king.move_to!(4,3)
    #   expect(king.x_position).to eq 4
    #   expect(king.y_position).to eq 3
    #   expect(rook.captured).to eq true
    # end
  end
end
