class Pawn < Piece
  # returns true if white pawn making its first move
  def first_move_north?(x,y)
    if self.y_position == 6
      if y == 5 || y == 4
        return true
      else
        return false
      end
    end
  end

  # returns true if white pawn moving 1 square north
  def one_square_north?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    start_y = self.y_position
    end_y = y
    if (start_y - end_y > 0) && (y_diff == 1) && (x_diff == 0)
      return true
    else
      return false
    end
  end

  # each pawn can move forward vertically 1 or 2 spaces for its first move
  # after its first move, each pawn moves 1 space forward vertically and cannot move backwards
  def valid_move?(x,y)
    # checks critera for valid_move? that apply to all pieces and returns false if fails
    return false unless super(x,y)
    # returns false if path blocked to destination square
    return false if path_blocked?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    # checks for white pawn
    if self.white?
      # allow white pawn to move 2 squares north on its first move only
      if self.first_move_north?(x,y)
        return true
      # otherwise can only move 1 square north
      else
        if self.one_square_north?(x,y)
          return true
        else
          return false
        end
      end
    end
  end

  def unicode_symbol
    if white?
      return "&#9817;"
    else
      return "&#9823;"
    end
  end
end
