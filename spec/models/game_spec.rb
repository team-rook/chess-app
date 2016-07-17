require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'initialize_board!' do
    it 'should have correct number of pieces' do
      game = Game.create(white_user_id: 0, black_user_id: 1)
      game.initialize_board!
      expect(game.pieces.count).to eq (32)
    end
  end
end
