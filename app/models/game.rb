class Game < ActiveRecord::Base
  belongs_to :white_user, :class_name => 'User'
  belongs_to :black_user, :class_name => 'User'
  has_many :pieces
  scope :needing_second_player, -> { where(black_user_id: nil) }

  

  def add_black_player(user)
    update(black_user: user)
  end

  def initialize_board!
    # black pieces
    (0..7).each do |i|
      Pawn.create(x_position: i, y_position: 1, game_id: id, user_id: black_user_id, piece_unicode: "&#9823;")
    end

    Rook.create(x_position: 0, y_position: 0, game_id: id, user_id: black_user_id, piece_unicode:"&#9820;")
    Rook.create(x_position: 7, y_position: 0, game_id: id, user_id: black_user_id, piece_unicode:"&#9820;")

    Knight.create(x_position: 1, y_position: 0, game_id: id, user_id: black_user_id, piece_unicode:"&#9822;")
    Knight.create(x_position: 6, y_position: 0, game_id: id, user_id: black_user_id, piece_unicode:"&#9822;")

    Bishop.create(x_position: 2, y_position: 0, game_id: id, user_id: black_user_id, piece_unicode:"&#9821;")
    Bishop.create(x_position: 5, y_position: 0, game_id: id, user_id: black_user_id, piece_unicode:"&#9821;")

    Queen.create(x_position: 3, y_position: 0, game_id: id, user_id: black_user_id, piece_unicode:"&#9819;")
    King.create(x_position: 4, y_position: 0, game_id: id, user_id: black_user_id, piece_unicode:"&#9818;")

    # white pieces
    (0..7).each do |i|
      Pawn.create(x_position: i, y_position: 7, game_id: id, user_id: white_user_id, piece_unicode:"&#9817;")
    end

    Rook.create(x_position: 0, y_position: 7, game_id: id, user_id: white_user_id, piece_unicode:"&#9814;")
    Rook.create(x_position: 7, y_position: 7, game_id: id, user_id: white_user_id, piece_unicode:"&#9814;")

    Knight.create(x_position: 1, y_position: 7, game_id: id, user_id: white_user_id, piece_unicode:"&#9816;")
    Knight.create(x_position: 6, y_position: 7, game_id: id, user_id: white_user_id, piece_unicode:"&#9816;")

    Bishop.create(x_position: 2, y_position: 7, game_id: id, user_id: white_user_id, piece_unicode:"&#9821;")
    Bishop.create(x_position: 5, y_position: 7, game_id: id, user_id: white_user_id, piece_unicode:"&#9821;")

    Queen.create(x_position: 3, y_position: 7, game_id: id, user_id: white_user_id, piece_unicode:"&#9813;")
    King.create(x_position: 4, y_position: 7, game_id: id, user_id: white_user_id, piece_unicode:"♚")
  end

  # return piece object occupying x,y square
  def find_piece(x, y)
    pieces.where(x_position: x, y_position: y).first
  end

  # returns true if space is occupied by a piece
  def square_occupied?(x, y)
    pieces.where(x_position: x, y_position: y).any?
  end

  def piece_data
  data = Hash.new { |hash, key| hash[key] = {} }
  pieces.each do |piece|
    data[piece.x_position][piece.y_position]=piece
  end
  data
end

end
