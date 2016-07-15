class Game < ActiveRecord::Base
  belongs_to :white_user, :class_name => 'User'
  belongs_to :black_user, :class_name => 'User'
  has_many :pieces

  scope :needing_second_player, -> { where(black_user_id: nil) }

  # find piece in game at x y coordinate
  def find_piece(x, y)
    pieces.where("x_position = ? AND y_position = ?", x, y)
  end
end
