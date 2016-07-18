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

  # returns true if attempting horizontal move
  def horizontal?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    return (x_diff > 0) && (y_diff == 0)
  end

  # returns true if attempting vertical move
  def vertical?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    return (x_diff == 0) && (y_diff > 0)
  end

  # returns true if attempting diagonal move
  def diagonal?(x,y)
    x_diff = x_diff(x)
    y_diff = y_diff(y)
    return (x_diff) == (y_diff)
  end

  # compares current x and destination x and returns the smaller value
  def x_min(x)
    [x_position, x].min
  end

  # compares current x and destination x and returns the larger value
  def x_max(x)
    [x_position, x].max
  end

  # compares current y and destination y and returns the smaller value
  def y_min(y)
    [y_position, y].min
  end

  # compares current y and destination y and returns the larger value
  def y_max(y)
    [y_position, y].max
  end

  # returns array of coordinates along the path of move
  def path_clear?
    return vertical_clear? if vertical?
    return horizontal_clear? if horizontal?
    return diagonal_clear? if diagonal?
    fail ArgumentError, 'Invalid path'
  end
end
