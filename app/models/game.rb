class Game < ActiveRecord::Base
  belongs_to :white_user, :class_name => 'User'
  belongs_to :black_user, :class_name => 'User'
  has_many :pieces
  after_create :initialize_board!

  def initialize_board!
    (0..7).each do |i|
      Pawn.create(x_position: i, y_position: 1)
    end

    Rook.create(x_position: 0, y_position: 0)
    Rook.create(x_position: 7, y_position: 0)

    Knight.create(x_position: 1, y_position: 0)
    Knight.create(x_position: 6, y_position: 0)

    Bishop.create(x_position: 2, y_position: 0)
    Bishop.create(x_position: 5, y_position: 0)

    Queen.create(x_position: 3, y_position: 0)
    King.create(x_position: 4, y_position: 0)

    (0..7).each do |i|
      Pawn.create(x_position: i, y_position: 7)
    end

    Rook.create(x_position: 0, y_position: 7)
    Rook.create(x_position: 7, y_position: 7)

    Knight.create(x_position: 1, y_position: 7)
    Knight.create(x_position: 6, y_position: 7)

    Bishop.create(x_position: 2, y_position: 7)
    Bishop.create(x_position: 5, y_position: 7)

    Queen.create(x_position: 3, y_position: 7)
    King.create(x_position: 4, y_position: 7)
  end
end
