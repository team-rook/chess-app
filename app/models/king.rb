class King < Piece
  # ensures king piece can only move 1 square in any direction
  def valid_move?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    return (x_diff <= 1) && (y_diff <= 1)
  end

  def unicode_symbol
    if white?
      return "&#9812;"
    else
      return "&#9818;"
    end
  end
end
