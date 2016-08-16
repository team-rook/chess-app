class King < Piece

  def valid_move?(x,y)
    # checks critera for valid_move? that apply to all pieces and returns false if fails
    return false unless super(x,y)
    return false if (self.game.check?(x,y) == false)
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
    x == 6 && y == y_position && castle_rook_kingside && \
    castle_rook_kingside.never_moved? && \
    castle_rook_kingside.path_blocked?(4, y_position) == false
  end

  #determines if king is attempting to castle on the queenside
  def castle_queenside?(x,y)
    x == 2 &&  y == y_position && castle_rook_queenside && \
    castle_rook_queenside.never_moved? && \
    castle_rook_queenside.path_blocked?(4, y_position) == false
  end

  #determines if there is a rook to castle with kingside
  def castle_rook_kingside
    @castle_rook_kingside = game.pieces.where(x_position: 7 , y_position: y_position, user_id: user_id, type: 'Rook').first
  end

  #determines if there is a rook to castle with queenside
  def castle_rook_queenside
    @castle_rook_queenside = game.pieces.where(x_position: 0 , y_position: y_position, user_id: user_id, type: 'Rook').first
  end
  #moves the rook when castling
  def castle!(x,y)
    if castle_kingside?(x,y)
      castle_rook_kingside.update_attributes(x_position: 5, y_position: y_position)
    end
    if castle_queenside?(x,y)
      castle_rook_queenside.update_attributes(x_position:3, y_position: y_position)
    end
      update_attributes(x_position: x, y_position: y)
  end

  def move_to!(x,y)
    castle!(x,y) if can_castle?(x,y)
    super(x,y)
  end


  def unicode_symbol
    if white?
      return "&#9812;"
    else
      return "&#9818;"
    end
  end
end
