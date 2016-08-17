class AddCounterToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :move_number, :integer, :default => 0 
  end
end
