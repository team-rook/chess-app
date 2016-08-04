class Pawn < Piece
  # returns true if pawn is moving north
  def north?(y)
    return ((y_position - y) > 0)
  end

  # returns true if pawn is moving south
  def south?(y)
    return ((y_position - y) < 0)
  end

  # returns true if pawn has never moved from home row
  def on_home_row?
    return (white? && y_position == 6) || y_position == 1
  end

  # returns true for first move only
  def first_move?(x,y)
    return on_home_row? && (x_diff(x) == 0) && (y_diff(y) == 2)
  end

  # returns true for standard move (1 square forward)
  def standard_move?(x,y)
    return (x_diff(x) == 0) && (y_diff(y) == 1)
  end

  # returns true if attempting capture move (1 square diagonal)
  def standard_capture?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    # returns true if moving only 1 square diagonally
    if (x_diff <= 1) && (y_diff <= 1)
      return true
    end
    return false
  end

  def valid_move?(x,y)
    return false unless super(x,y)
    return false if path_blocked?(x,y)
    # pawns cannot move backwards
    return false if white? && south?(y)
    return false if black? && north?(y)
    # each pawn can move forward 1 or 2 spaces for its first move only
    # otherwise move 1 space forward
    return true if standard_move?(x,y) || first_move?(x,y)
    # pawns capture one square diagonally
    return true if standard_capture?(x,y)
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
