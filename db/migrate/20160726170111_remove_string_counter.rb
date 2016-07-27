class RemoveStringCounter < ActiveRecord::Migration
  def change
  	remove_column :games, :move_counter, :string
  	add_column :games, :move_counter, :integer, :default => 0 
  end
end
