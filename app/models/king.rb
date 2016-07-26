class King < Piece
  # ensures king piece can only move 1 square in any direction
  def valid_move?(x,y)
    # checks critera for valid_move? that apply to all pieces and returns false if fails
    return false unless super(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    # returns true if moving only 1 square any direction
    if (x_diff <= 1) && (y_diff <= 1)
      return true
    end
    # returns false if not moving only 1 square any direction
    return false
  end

  def unicode_symbol
    if white?
      return "&#9812;"
    else
      return "&#9818;"
    end
  end
end
