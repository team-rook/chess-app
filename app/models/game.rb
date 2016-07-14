class Game < ActiveRecord::Base
  belongs_to :white_user, :class_name => 'User'
  belongs_to :black_user, :class_name => 'User'
  has_many :pieces

  scope :needing_second_player, -> { where(black_user_id: nil) }

  # find piece in game at x y coordinate
  def find_piece(x, y)
    pieces.where("x_position = ? AND y_position = ?", x, y)
  end

  # determine if the current square is occupied
  def square_occupied?(x, y)
    find_piece(x, y).any?
  end

  # determine if the total row/column/diagonal is occupied
  def range_occupied?(x1, y1, x2, y2)
    pieces.where("x_position BETWEEN ? AND ? AND y_position BETWEEN ? AND ?", x1, x2, y1, y2).any?
  end
end
