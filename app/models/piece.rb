class Piece < ActiveRecord::Base
  self.inheritance_column = :type
  belongs_to :user
  belongs_to :game

  def white?
     self.user == self.game.white_user
  end

  def black?
    !white?
  end

  def self.types
    %w(Pawn Rook Bishop Knight Queen King)
  end

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

  # is_obstructed? returns true if the current piece cannot move to its destination because a piece on its own team is in its way
  def is_obstructed?(dest_x, dest_y)
    # current location
    current_x = x_position
    current_y = y_position
    # the change in state from current location to destination
    delta_x = dest_x - current_x
    delta_y = dest_y - current_y

    # CHECK HORIZONTAL MOVES
    # horizontal move where start is < destination and distance > 1
    if delta_y == 0 && delta_x > 0 && delta_x.abs > 1
      return self.range_occupied?((current_x + 1), (dest_x - 1), current_y, current_y)
    # horizontal move where start is > destination and distance > 1
    elsif delta_y == 0 && delta_x < 0 && delta_x.abs > 1
      return self.range_occupied?((dest_x + 1), (current_x - 1), current_y, current_y)
    # horizontal move to next square or delta == 0
    elsif delta_y == 0 && delta_x.abs <= 1
      return false
    # CHECK VERTICAL MOVES
    # vertical move where start is < destination and distance > 1
    elsif delta_x == 0 && delta_y > 0 && delta_y.abs > 1
      return self.range_occupied?(current_x, current_x, (current_y + 1), (dest_y - 1))
    # vertical move where start is > destination and distance > 1
    elsif delta_x == 0 && delta_y < 0 && delta_y.abs > 1
      return self.range_occupied?(current_x, current_x, (dest_y + 1), (current_y - 1))
    # vertical move to next square or delta == 0
    elsif delta_x == 0 && delta_y.abs <= 1
      return false
    # CHECK DIAGONAL MOVES
    # Positive X, positive Y diagonal
    elsif delta_x == delta_y && delta_x > 0
      steps = delta_x - 1
      steps.times do
        current_x += 1
        current_y += 1
        return true if self.square_occupied?((current_x), (current_y))
      end
      return false
    # Negative X, negative Y diagonal
    elsif delta_x == delta_y && delta_x < 0
      steps = delta_x.abs - 1
      steps.times do
        current_x -= 1
        current_y -= 1
        return true if self.square_occupied?((current_x), (current_y))
      end
      return false
      # Positive X, negative Y diagonal
    elsif delta_x > 0 && delta_y < 0 && delta_x == delta_y.abs
      steps = delta_x - 1
      steps.times do
        current_x += 1
        current_y -= 1
        return true if self.square_occupied?((current_x), (current_y))
      end
      return false
    # Negative X, positive Y diagonal
    elsif delta_x < 0 && delta_y > 0 && delta_x.abs == delta_y
      steps = delta_y - 1
      steps.times do
        current_x -= 1
        current_y += 1
        return true if self.square_occupied?((current_x), (current_y))
      end
      return false
    end
  end
end
