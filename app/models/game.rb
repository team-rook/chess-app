class Game < ActiveRecord::Base
  belongs_to :white_user, :class_name => 'User'
  belongs_to :black_user, :class_name => 'User'
  has_many :pieces
  scope :needing_second_player, -> { where(black_user_id: nil) }

  def initialize_board!
    # black pieces
    (0..7).each do |i|
      Pawn.create(x_position: i, y_position: 1, game_id: id, user_id: black_user_id)
    end

    Rook.create(x_position: 0, y_position: 0, game_id: id, user_id: black_user_id)
    Rook.create(x_position: 7, y_position: 0, game_id: id, user_id: black_user_id)

    Knight.create(x_position: 1, y_position: 0, game_id: id, user_id: black_user_id)
    Knight.create(x_position: 6, y_position: 0, game_id: id, user_id: black_user_id)

    Bishop.create(x_position: 2, y_position: 0, game_id: id, user_id: black_user_id)
    Bishop.create(x_position: 5, y_position: 0, game_id: id, user_id: black_user_id)

    Queen.create(x_position: 3, y_position: 0, game_id: id, user_id: black_user_id)
    King.create(x_position: 4, y_position: 0, game_id: id, user_id: black_user_id)

    # white pieces
    (0..7).each do |i|
      Pawn.create(x_position: i, y_position: 7, game_id: id, user_id: white_user_id)
    end

    Rook.create(x_position: 0, y_position: 7, game_id: id, user_id: white_user_id)
    Rook.create(x_position: 7, y_position: 7, game_id: id, user_id: white_user_id)

    Knight.create(x_position: 1, y_position: 7, game_id: id, user_id: white_user_id)
    Knight.create(x_position: 6, y_position: 7, game_id: id, user_id: white_user_id)

    Bishop.create(x_position: 2, y_position: 7, game_id: id, user_id: white_user_id)
    Bishop.create(x_position: 5, y_position: 7, game_id: id, user_id: white_user_id)

    Queen.create(x_position: 3, y_position: 7, game_id: id, user_id: white_user_id)
    King.create(x_position: 4, y_position: 7, game_id: id, user_id: white_user_id)
  end

  def find_piece(x, y)
    pieces.where("x_position = ? AND y_position = ?", x, y).first
  end

  def square_occupied?(x, y)
    pieces.where("x_position = ? AND y_position = ?", x, y).any?
  end
end
