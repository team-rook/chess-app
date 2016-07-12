class Game < ActiveRecord::Base
  belongs_to :white_user, :class_name => 'User'
  belongs_to :black_user, :class_name => 'User'
  has_many :pieces
  after_create :initialize_board!

  def initialize_board!
    # black pieces
    Rook.create(user: black_user, x_position: 0, y_position: 0)
    Rook.create(user: black_user, x_position: 7, y_position: 0)

    Knight.create(user: black_user, x_position: 1, y_position: 0)
    Knight.create(user: black_user, x_position: 6, y_position: 0)

    Bishop.create(user: black_user, x_position: 2, y_position: 0)
    Bishop.create(user: black_user, x_position: 5, y_position: 0)

    Queen.create(user: black_user, x_position: 3, y_position: 0)

    King.create(user: black_user, x_position: 4, y_position: 0)

    (0..7).each do |i|
      Pawn.create(user: black_user, x_position: i, y_position: 1)
    end

    # white pieces
    Rook.create(user: white_user, x_position: 0, y_position: 7)
    Rook.create(user: white_user, x_position: 7, y_position: 7)

    Knight.create(user: white_user, x_position: 1, y_position: 7)
    Knight.create(user: white_user, x_position: 6, y_position: 7)

    Bishop.create(user: white_user, x_position: 2, y_position: 7)
    Bishop.create(user: white_user, x_position: 5, y_position: 7)

    Queen.create(user: white_user, x_position: 3, y_position: 7)

    King.create(user: white_user, x_position: 4, y_position: 7)

    (0..7).each do |i|
      Pawn.create(user: white_user, x_position: i, y_position: 7)
    end
  end
end
