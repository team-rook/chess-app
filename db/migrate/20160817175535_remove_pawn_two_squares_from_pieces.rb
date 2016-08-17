class RemovePawnTwoSquaresFromPieces < ActiveRecord::Migration
  def change
    remove_column :pieces, :pawn_two_squares, :boolean
  end
end
