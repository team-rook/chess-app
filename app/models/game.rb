class Game < ActiveRecord::Base
  belongs_to :white_user, :class_name => 'User'
  belongs_to :black_user, :class_name => 'User'
  has_many :pieces
  scope :needing_second_player, -> { where(black_user_id: nil) }


  def active_player
    if self.move_counter % 2 == 0
    return white_user
   end
    return black_user
  end


  def add_black_player(user)
    update(black_user: user)
    initialize_board!
  end

  def initialize_board!
    # black pieces
    (0..7).each do |i|
      Pawn.create(x_position: i, y_position: 1, game_id: id, user_id: black_user_id)
    end

    Rook.create(x_position: 0, y_position: 0, game_id: id, user_id: black_user_id)
    Rook.create(x_position: 7, y_position: 0, game_id: id, user_id: black_user_id)

    Knight.create(x_position: 1, y_position: 0, game_id: id, user_id: black_user_id)
    Knight.create(x_position: 6, y_position: 0, game_id: id, user_id: black_user_id)

    Bishop.create(x_position: 2, y_position: 0, game_id: id, user_id: black_user_id)
    Bishop.create(x_position: 5, y_position: 0, game_id: id, user_id: black_user_id)

    Queen.create(x_position: 3, y_position: 0, game_id: id, user_id: black_user_id)
    King.create(x_position: 4, y_position: 0, game_id: id, user_id: black_user_id)

    # white pieces
    (0..7).each do |i|
      Pawn.create(x_position: i, y_position: 6, game_id: id, user_id: white_user_id)
    end

    Rook.create(x_position: 0, y_position: 7, game_id: id, user_id: white_user_id)
    Rook.create(x_position: 7, y_position: 7, game_id: id, user_id: white_user_id)

    Knight.create(x_position: 1, y_position: 7, game_id: id, user_id: white_user_id)
    Knight.create(x_position: 6, y_position: 7, game_id: id, user_id: white_user_id)

    Bishop.create(x_position: 2, y_position: 7, game_id: id, user_id: white_user_id)
    Bishop.create(x_position: 5, y_position: 7, game_id: id, user_id: white_user_id)

    Queen.create(x_position: 3, y_position: 7, game_id: id, user_id: white_user_id)
    King.create(x_position: 4, y_position: 7, game_id: id, user_id: white_user_id)
  end

  # return piece object occupying x,y square
  def find_piece(x,y)
    pieces.active.where(x_position: x, y_position: y).first
  end

  # returns true if space is occupied by a piece
  def square_occupied?(x,y)
    pieces.active.where(x_position: x, y_position: y).any?
  end

  def piece_data
    data = Hash.new { |hash, key| hash[key] = {} }
    pieces.active.each do |piece|
      data[piece.x_position][piece.y_position]=piece
    end
    data
  end
end
