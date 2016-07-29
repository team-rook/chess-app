class King < Piece

  def valid_move?(x,y)
    # checks critera for valid_move? that apply to all pieces and returns false if fails unless can_castle
    (normal_valid_move?(x,y) && super(x,y)) || can_castle?(x,y)
  end

  # ensures king piece can only move 1 square in any direction
  def normal_valid_move?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    # returns true if moving only 1 square any direction
    if (x_diff <= 1) && (y_diff <= 1)
      return true
    end
    # returns false if not moving only 1 square any direction
    return false
  end


  def can_castle?(x,y)
    updated_at == created_at && \
    ((x == 6 && castle_rook && castle_rook.x_position == 7 && \
    castle_rook.updated_at == castle_rook.created_at && \
    castle_rook.path_blocked?(5, y_position) == false) || \
    (x == 2 && castle_rook && castle_rook.x_position == 0 && \
    castle_rook.updated_at == castle_rook.created_at && \
    castle_rook.path_blocked?(3, y_position) == false )) && \
    [y, castle_rook.y_position].uniq == y_position
  end


  def castle_rook
    @castle_rook = game.pieces.where(x_position: 0, type: Rook).first || game.pieces.where(x_position: 7, type: Rook).first
  end


  def castle!
    castle_rook.move_to((rook.x_position - (rook.x_position - king.x_position).abs + 1), y_position)
  end


  def move_to(x,y)
    castle! if can_castle?(x,y)
    super
  end


  def unicode_symbol
    if white?
      return "&#9812;"
    else
      return "&#9818;"
    end
  end
end
