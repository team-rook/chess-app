class Piece < ActiveRecord::Base
  self.inheritance_column = :type
  belongs_to :user
  belongs_to :game

  scope :active, -> { where(captured: nil) }

  def white?
    self.user == self.game.white_user
  end

  def black?
    self.user == self.game.black_user
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

  # returns x value of first square to check along the path
  def x_start(x)
    [x_position, x].min + 1
  end

  # returns x value of last square to check along the path
  def x_end(x)
    [x_position, x].max
  end

  # returns y value of first square to check along the path
  def y_start(y)
    [y_position, y].min + 1
  end

  # returns y value of last square to check along the path
  def y_end(y)
    [y_position, y].max
  end

  # returns true if the horizontal path is blocked
  def horizontal_blocked?(x,y)
    (x_start(x)...x_end(x)).each do |x|
      return true if game.square_occupied?(x,y)
    end
    return false
  end

  # returns true if the vertical path is blocked
  def vertical_blocked?(x,y)
    (y_start(y)...y_end(y)).each do |y|
      return true if game.square_occupied?(x,y)
    end
    return false
  end

  # return true if diagonal path is blocked
  def diagonal_blocked?(x,y)
    (x_start(x)...x_end(x)).each do |x|
      (y_start(y)...y_end(y)).each do |y|
        return true if game.square_occupied?(x,y)
      end
    end
    return false
  end

  # returns true if the path is blocked
  def path_blocked?(x,y)
    return horizontal_blocked?(x,y) if horizontal?(x,y)
    return vertical_blocked?(x,y) if vertical?(x,y)
    return diagonal_blocked?(x,y) if diagonal?(x,y)
  end

  # checks if piece can make the desired moved
  def valid_move?(x,y)
    return false if x < 0 || x > 7 || y < 0 || y > 7
    return true
  end

  def captured!
    self.update(captured: true)
  end

  def captured?
    self.captured == true
  end

  # moves piece to the destination square
  def move_to!(x,y)
    if valid_move?(x,y)
      update_attributes(x_position: x, y_position: y)
      self.game.move_counter += 1
    end
  end
end
