class Bishop < Piece

    def unicode_symbol
      if white?
       return "&#9815;"
      else 
     return "&#9821;"
    end
  end
end
