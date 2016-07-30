class King < Piece

  def valid_move?(x,y)
    # checks critera for valid_move? that apply to all pieces and returns false if fails
    return false unless super(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    # returns true if moving only 1 square any direction
    return true if (x_diff <= 1) && (y_diff <= 1)

    #returns true if the king can castle
    return true if can_castle?(x,y)

    # returns false if not moving only 1 square any direction and can't castle
    return false
  end


  def can_castle?(x,y)
    never_moved? && (castle_kingside?(x,y) || castle_queenside?(x,y))
  end

  #determines if king is attempting to castle on the kingside
  def castle_kingside?(x,y)
    x == 6 && castle_rook && castle_rook.x_position == 7 && \
    castle_rook.never_moved? && \
    castle_rook.path_blocked?(5, y_position) == false && \
    [y, castle_rook.y_position].uniq == y_position
  end

  #determines if king is attempting to castle on the queenside
  def castle_queenside?(x,y)
    x == 2 && castle_rook && castle_rook.x_position == 0 && \
    castle_rook.never_moved? && \
    castle_rook.path_blocked?(3, y_position) == false && \
    [y, castle_rook.y_position].uniq == y_position
  end

  #determines if there is a rook to castle with
  def castle_rook
    @castle_rook = game.pieces.where(y_position: y_position, user_id: user_id, type: Rook).first 
  end


  def castle!
    castle_rook.move_to!((rook.x_position - (rook.x_position - king.x_position).abs + 1), y_position)
  end


  def move_to!(x,y)
    success = super(x,y)
    if success 
      castle! if can_castle?(x,y)
    end
  end


  def unicode_symbol
    if white?
      return "&#9812;"
    else
      return "&#9818;"
    end
  end
end
