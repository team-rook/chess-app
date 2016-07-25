class Knight < Piece
  # knight can move 2 squares horizontal and 1 square north or south
  # knight can move 2 squares vertical and 1 square east or west
  def valid_move?(x,y)
    # checks critera for valid_move? that apply to all pieces and returns false if fails
    return false unless super(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    # returns true if moving 2 squares horizontal and 1 square vertical
    if ((x_diff == 2) && (y_diff == 1))
      return true
    end
    # returns true if moving 2 squares vertical and 1 square horizontal
    if ((y_diff == 2) && (x_diff == 1))
      return true
    end
    # returns false if not moving as knights should
    return false
  end

  def unicode_symbol
    if white?
      return "&#9816;"
    else
      return  "&#9822;"
    end
  end
end
