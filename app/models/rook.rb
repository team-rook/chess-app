class Rook < Piece
  
  def unicode_symbol
    if white?
     return "&#9814;"
    else
     return "&#9820;"
  end
end


end
