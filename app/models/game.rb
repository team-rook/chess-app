class Game < ActiveRecord::Base
  belongs_to :white_user, :class_name => 'User'
  belongs_to :black_user, :class_name => 'User'
  has_many :pieces
  after_create :initialize_board!

  scope :needing_second_player, -> { where(black_user: nil) }


  def initialize_board!
    (0..7).each do |i|
      Pawn.create(color: 'black', x_position: i, y_position: 1, game_id: id)
    end

    Rook.create(color: 'black', x_position: 0, y_position: 0, game_id: id)
    Rook.create(color: 'black', x_position: 7, y_position: 0, game_id: id)

    Knight.create(color: 'black', x_position: 1, y_position: 0, game_id: id)
    Knight.create(color: 'black', x_position: 6, y_position: 0, game_id: id)

    Bishop.create(color: 'black', x_position: 2, y_position: 0, game_id: id)
    Bishop.create(color: 'black', x_position: 5, y_position: 0, game_id: id)

    Queen.create(color: 'black', x_position: 3, y_position: 0, game_id: id)
    King.create(color: 'black', x_position: 4, y_position: 0, game_id: id)

    (0..7).each do |i|
      Pawn.create(color: 'white', x_position: i, y_position: 7, game_id: id)
    end

    Rook.create(color: 'white', x_position: 0, y_position: 7, game_id: id)
    Rook.create(color: 'white', x_position: 7, y_position: 7, game_id: id)

    Knight.create(color: 'white', x_position: 1, y_position: 7, game_id: id)
    Knight.create(color: 'white', x_position: 6, y_position: 7, game_id: id)

    Bishop.create(color: 'white', x_position: 2, y_position: 7, game_id: id)
    Bishop.create(color: 'white', x_position: 5, y_position: 7, game_id: id)

    Queen.create(color: 'white', x_position: 3, y_position: 7, game_id: id)
    King.create(color: 'white', x_position: 4, y_position: 7, game_id: id)
  end
end
