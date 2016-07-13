class Game < ActiveRecord::Base
  belongs_to :white_user, :class_name => 'User'
  belongs_to :black_user, :class_name => 'User'
  has_many :pieces
  after_create :initialize_board!

  def initialize_board!
    (0..7).each do |i|
      Pawn.create(x_position: i, y_position: 1, user_id: id, game_id: id)
    end

    Rook.create(x_position: 0, y_position: 0, user_id: id, game_id: id)
    Rook.create(x_position: 7, y_position: 0, user_id: id, game_id: id)

    Knight.create(x_position: 1, y_position: 0, user_id: id, game_id: id)
    Knight.create(x_position: 6, y_position: 0, user_id: id, game_id: id)

    Bishop.create(x_position: 2, y_position: 0, user_id: id, game_id: id)
    Bishop.create(x_position: 5, y_position: 0, user_id: id, game_id: id)

    Queen.create(x_position: 3, y_position: 0, user_id: id, game_id: id)
    King.create(x_position: 4, y_position: 0, user_id: id, game_id: id)

    (0..7).each do |i|
      Pawn.create(x_position: i, y_position: 7, user_id: id, game_id: id)
    end

    Rook.create(x_position: 0, y_position: 7, user_id: id, game_id: id)
    Rook.create(x_position: 7, y_position: 7, user_id: id, game_id: id)

    Knight.create(x_position: 1, y_position: 7, user_id: id, game_id: id)
    Knight.create(x_position: 6, y_position: 7, user_id: id, game_id: id)

    Bishop.create(x_position: 2, y_position: 7, user_id: id, game_id: id)
    Bishop.create(x_position: 5, y_position: 7, user_id: id, game_id: id)

    Queen.create(x_position: 3, y_position: 7, user_id: id, game_id: id)
    King.create(x_position: 4, y_position: 7, user_id: id, game_id: id)
  end
end
