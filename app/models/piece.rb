class Piece < ActiveRecord::Base
  self.inheritance_column = :type
  belongs_to :user
  belongs_to :game

  def self.types
    %w(Pawn Rook Bishop Knight Queen King)
  end
end


class Pawn < Piece; end
class Rook < Piece; end
class Bishop < Piece; end
class Knight < Piece; end
class Queen < Piece; end
class King < Piece; end
