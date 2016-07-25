require 'rails_helper'

RSpec.describe Knight, type: :model do
  describe 'valid_move?' do
    it 'should return true if moving two squares north and one square east' do
      knight = Knight.create(x_position: 2, y_position: 5)
      expect(knight.valid_move?(3,3)).to eq true
    end

    it 'should return true if moving two squares north and one square west' do
      knight = Knight.create(x_position: 2, y_position: 5)
      expect(knight.valid_move?(1,3)).to eq true
    end

    it 'should return true if moving two squares south and one square east' do
      knight = Knight.create(x_position: 1, y_position: 3)
      expect(knight.valid_move?(2,5)).to eq true
    end

    it 'should return true if moving two squares west and one square south' do
      knight = Knight.create(x_position: 3, y_position: 3)
      expect(knight.valid_move?(1,4)).to eq true
    end

    it 'should return true if moving two squares east and one square north' do
      knight = Knight.create(x_position: 3, y_position: 3)
      expect(knight.valid_move?(5,2)).to eq true
    end

    it 'should return false if moving to a random square' do
      knight = Knight.create(x_position: 3, y_position: 3)
      expect(knight.valid_move?(6,5)).to eq false
    end
  end
end
