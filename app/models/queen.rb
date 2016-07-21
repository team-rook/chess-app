class Queen < Piece


  def unicode_symbol
    
    if white?
   return   "&#9813;"
    else
    return  "&#9819;"
  end
end

end
