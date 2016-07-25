class Queen < Piece
  # can move horizontal, vertical, or diagonal for unlimited spaces unless path blocked
  def valid_move?(x,y)
    # checks critera for valid_move? that apply to all pieces and returns false if fails
    return false unless super(x,y)
    # returns false if path blocked to destination square
    return false if path_blocked?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    # returns true if moving diagonally
    return true if x_diff == y_diff
    # returns true if moving horizontally
    if ((x_diff > 0) && (y_diff == 0))
      return true
    end
    # returns true if moving vertically
    if ((x_diff == 0) && (y_diff > 0))
      return true
    end
    # returns false if not moving horizontally, vertically, or diagonally
    return false
  end

  def unicode_symbol
    if white?
      return   "&#9813;"
    else
      return  "&#9819;"
    end
  end
end
