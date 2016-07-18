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

  describe 'x_min' do
    it 'should compare current x and destination x and return the smaller value' do
      rook = Rook.create(x_position: 0, y_position: 0)
      expect(rook.x_min(7)).to eq 0
    end
  end

  describe 'x_max' do
    it 'should compare current x and destination x and return the larger value' do
      rook = Rook.create(x_position: 0, y_position: 0)
      expect(rook.x_max(7)).to eq 7
    end
  end

  describe 'y_min' do
    it 'should compare current y and destination y and return the smaller value' do
      rook = Rook.create(x_position: 0, y_position: 0)
      expect(rook.y_min(7)).to eq 0
    end
  end

  describe 'y_max' do
    it 'should compare current y and destination y and return the larger value' do
      rook = Rook.create(x_position: 0, y_position: 0)
      expect(rook.y_max(7)).to eq 7
    end
  end
end
