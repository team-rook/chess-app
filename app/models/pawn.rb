class Pawn < Piece

     def unicode_symbol
      if white?
        return "&#9817;"
      else
        return "&#9823;"
    end
  end
  
end
