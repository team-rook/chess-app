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

  # returns absolute value of destination x - current x position
  def x_diff(x)
    (x - x_position).abs
  end

  # returns absolute value of destination y - current y position
  def y_diff(y)
    (y - y_position).abs
  end
end
