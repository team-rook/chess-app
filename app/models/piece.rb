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

  def x_diff(x)
    (x - x_position).abs
  end

  def y_diff(y)
    (y - y_position).abs
  end
end
