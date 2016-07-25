class Queen < Piece
  # can move horizontal, vertical, or diagonal for unlimited spaces unless path blocked
  def valid_move?(x,y)
    return false if path_blocked?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    return true if x_diff == y_diff
    if ((x_diff > 0) && (y_diff == 0))
      return true
    end
    if ((x_diff == 0) && (y_diff > 0))
      return true
    end
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
