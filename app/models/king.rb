class King < Piece
  def valid_move?(x,y)
    x_diff = (x - x_position).abs
    y_diff = (y - y_position).abs
    return (x_diff <= 1) && (y_diff <= 1)
  end
end
