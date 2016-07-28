class Pawn < Piece
  # returns true if pawn is moving north
  def north?(x,y)
    return ((y_position - y) > 0)
  end

  # returns true if pawn is moving south
  def south?(x,y)
    return ((y_position - y) < 0)
  end

  # returns true if white pawn making a legal first move
  def first_move_north?(x,y)
    return (y_position == 6) && (y == 5 || y == 4)
  end

  # returns true if white pawn moving 1 square north
  def one_square_north?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    return true if north?(x,y) && y_diff == 1 && x_diff == 0
    return false
  end

  # returns true if black pawn making legal first move
  def first_move_south?(x,y)
    return (y_position == 1) && (y == 2 || y == 3)
  end

  # returns true if black pawn moving 1 square south
  def one_square_south?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    return true if south?(x,y) && y_diff == 1 && x_diff == 0
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
    if white? && north?(x,y)
      # allow white pawn to move 2 squares north on its first move only
      return true if first_move_north?(x,y)
      # allow white pawn to move 1 square north on any turn
      return true if one_square_north?(x,y)
    else
      # allow black pawn to move 2 squares south on its first move only
      return true if first_move_south?(x,y)
      # allow white pawn to move 1 square south on any turn
      return true if one_square_south?(x,y)
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
