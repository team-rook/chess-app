class Rook < Piece
  # can move horizontal or vertical for unlimited spaces
  def valid_move?(x,y)
    return false if path_blocked?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
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
     return "&#9814;"
    else
     return "&#9820;"
  end
end


end
