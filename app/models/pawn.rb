class Pawn < Piece
  # returns true if pawn is moving north
  def north?(x,y)
    start_y = self.y_position
    end_y = y
    return true if ((start_y - end_y) > 0)
    return false
  end

  # returns true if pawn is moving south
  def south?(x,y)
    start_y = self.y_position
    end_y = y
    return true if ((start_y - end_y) < 0)
    return false
  end

  # returns true if white pawn making a legal first move
  def first_move_north?(x,y)
    return true if (self.y_position == 6) && (y == 5 || y == 4)
    return false
  end

  # returns true if white pawn moving 1 square north
  def one_square_north?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    return true if self.north?(x,y) && y_diff == 1 && x_diff == 0
    return false
  end

  # returns true if black pawn making legal first move
  def first_move_south?(x,y)
    return true if (self.y_position == 1) && (y == 2 || y == 3)
    return false
  end

  # returns true if black pawn moving 1 square south
  def one_square_south?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    return true if self.south?(x,y) && y_diff == 1 && x_diff == 0
    return false
  end

  # each pawn can move forward vertically 1 or 2 spaces for its first move
  # after its first move, each pawn moves 1 space forward vertically and cannot move backwards
  def valid_move?(x,y)
    # checks critera for valid_move? that apply to all pieces and returns false if fails
    return false unless super(x,y)
    # returns false if path blocked to destination square
    return false if path_blocked?(x,y)
    # check move for white pawn
    if self.white?
      # allow white pawn to move 2 squares north on its first move only
      return true if self.first_move_north?(x,y)
      # allow white pawn to move 1 square north on any turn
      return true if self.one_square_north?(x,y)
    end
    # check move for black pawn
    if self.black?
      # allow black pawn to move 2 squares south on its first move only
      return true if self.first_move_south?(x,y)
      # allow white pawn to move 1 square south on any turn
      return true if self.one_square_south?(x,y)
    end
    return false
  end

  def unicode_symbol
    if white?
      return "&#9817;"
    else
      return "&#9823;"
    end
  end
end
