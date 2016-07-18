class King < Piece
  def valid_move?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    return (x_diff <= 1) && (y_diff <= 1)
  end
end
