class Knight < Piece
  
   def unicode_symbol
      if white?
      return "&#9816;"
      else 
      return  "&#9822;"
    end
  end
end
