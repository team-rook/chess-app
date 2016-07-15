class Piece < ActiveRecord::Base
  self.inheritance_column = :type
  belongs_to :user
  belongs_to :game

  def white?
     self.user == self.game.white_user
  end

  def black?
    !white?
  end

  def self.types
    %w(Pawn Rook Bishop Knight Queen King)
  end

  # returns true if the current piece cannot move to its destination because a piece is in its way
  def is_obstructed?(dest_x, dest_y)

  end
end
