class Rook < Piece
  # can move horizontal or vertical for unlimited spaces unless path blocked
  def valid_move?(x,y)
    # checks critera for valid_move? that apply to all pieces and returns false if fails
    return false unless super(x,y)
    # returns false if path blocked to destination square
    return false if path_blocked?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    # returns true if moving horizontal
    if ((x_diff > 0) && (y_diff == 0))
      return true
    end
    # returns true if moving vertical
    if ((x_diff == 0) && (y_diff > 0))
      return true
    end
    # returns false if not moving horizontally or vertically
    return false
  end

  def unicode_symbol
    if white?
      return "&#9814;"
    else
      return "&#9820;"
    end
  end
end
