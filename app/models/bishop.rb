class Bishop < Piece
  # can move diagonal for unlimited spaces unless path blocked
  def valid_move?(x,y)
    # checks critera for valid_move? that apply to all pieces and returns false if fails
    return false unless super(x,y)
    # returns false if path blocked to destination square
    return false if path_blocked?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    # returns true if moving diagonally
    return true if x_diff == y_diff
    # returns false if not moving diagonally
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
