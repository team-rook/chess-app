require 'rails_helper'

RSpec.describe King, type: :model do
  describe 'valid_move?' do
    it 'should return true if moving one square east' do
      black_king = King.create(x_position: 4, y_position: 0)
      expect(black_king.valid_move?(5,0)).to eq true
    end

    it 'should return true if moving one square west' do
      black_king = King.create(x_position: 4, y_position: 0)
      expect(black_king.valid_move?(3,0)).to eq true
    end

    it 'should return true if moving one square north' do
      black_king = King.create(x_position: 4, y_position: 1)
      expect(black_king.valid_move?(4,0)).to eq true
    end

    it 'should return true if moving one square south' do
      black_king = King.create(x_position: 4, y_position: 1)
      expect(black_king.valid_move?(4,2)).to eq true
    end

    it 'should return true if moving one square northeast' do
      black_king = King.create(x_position: 4, y_position: 1)
      expect(black_king.valid_move?(5,0)).to eq true
    end

    it 'should return true if moving one square northwest' do
      black_king = King.create(x_position: 4, y_position: 1)
      expect(black_king.valid_move?(3,0)).to eq true
    end

    it 'should return true if moving one square southwest' do
      black_king = King.create(x_position: 4, y_position: 1)
      expect(black_king.valid_move?(3,2)).to eq true
    end

    it 'should return true if moving one square southeast' do
      black_king = King.create(x_position: 4, y_position: 1)
      expect(black_king.valid_move?(5,2)).to eq true
    end

    it 'should return false if moving more than one square east' do
      black_king = King.create(x_position: 4, y_position: 0)
      expect(black_king.valid_move?(7,0)).to eq false
    end

    it 'should return false if moving more than one square south' do
      black_king = King.create(x_position: 4, y_position: 0)
      expect(black_king.valid_move?(4,5)).to eq false
    end

    it 'should return false if moving more than one square southwest' do
      black_king = King.create(x_position: 4, y_position: 0)
      expect(black_king.valid_move?(0,4)).to eq false
    end

    it 'should return false if moving to a random square on the board' do
      black_king = King.create(x_position: 4, y_position: 0)
      expect(black_king.valid_move?(2,7)).to eq false
    end
  end
end
