class AddPawnTwoSquareToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :pawn_two_squares, :boolean
  end
end
