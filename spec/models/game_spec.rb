require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'find_piece should work' do
    it 'should return the piece that is on the specified (x_position, y_position)' do
      funsies = Game.create(white_user_id: 0, black_user_id: 1)
      piece1 = 
    end
  end
end
