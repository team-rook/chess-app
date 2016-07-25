class Bishop < Piece
  # can move diagonal for unlimited spaces unless path blocked
  def valid_move?(x,y)
    return false if path_blocked?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    return true if x_diff == y_diff
    return false
  end

  def unicode_symbol
    if white?
      return "&#9815;"
    else
      return "&#9821;"
    end
  end
end
