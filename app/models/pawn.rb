class Pawn < Piece
  # returns true if pawn is moving north
  def north?(y)
    return ((y_position - y) > 0)
  end

  # returns true if pawn is moving south
  def south?(y)
    return ((y_position - y) < 0)
  end

  # returns true if pawn has never moved from home row
  def on_home_row?
    return (white? && y_position == 6) || y_position == 1
  end

  # returns true for first move only
  def two_squares?(x,y)
    return on_home_row? && (x_diff(x) == 0) && (y_diff(y) == 2)
  end

  # returns true for standard move (1 square forward)
  def standard_move?(x,y)
    return (x_diff(x) == 0) && (y_diff(y) == 1)
  end

  # returns true if attempting capture move (1 square diagonal)
  def pawn_diagonal?(x,y)
    diagonal?(x, y) && x_diff(x) == 1
  end

  def valid_move?(x,y)
    return false unless super(x,y)
    return false if path_blocked?(x,y)

    # pawns cannot move backwards
    return false if white? && south?(y)
    return false if black? && north?(y)

    # each pawn can move forward 1 or 2 spaces for its first move only
    # otherwise move 1 space forward or pawns capture one square diagonally
    standard_move?(x,y) ||
      two_squares?(x,y) ||
      (pawn_diagonal?(x,y) && capture_valid?(x,y))
  end

  def capture_piece_at(x,y)
    if can_be_captured_en_passant?(x,unfriendly_y(y))
      game.find_piece(x,unfriendly_y(y)).captured!
    else
      game.find_piece(x,y).captured!
    end

    true
  end

  def unfriendly_y(y)
    y + (black? ? -1 : 1)
  end

  def capture_valid?(x,y)
    game.square_occupied?(x,y) || can_be_captured_en_passant?(x,unfriendly_y(y))
  end

  # returns true if unfriendly pawn moved 2 squares on its first move and now can be captured en passant
  def can_be_captured_en_passant?(x,y)
    return false unless piece = self.game.find_piece(x,y)
    (piece.type == "Pawn") && (piece.white? != white?) && (piece.just_moved_two_spaces?)
  end

  def just_moved_two_spaces?
    move_number == 1 && y_position == (black? ? 3 : 4)
  end

  def unicode_symbol
    if white?
      return "&#9817;"
    else
      return "&#9823;"
    end
  end
end
