class RemoveCurrentPositionFromPieces < ActiveRecord::Migration
  def change
    remove_column :pieces, :current_position, :integer
  end
end
