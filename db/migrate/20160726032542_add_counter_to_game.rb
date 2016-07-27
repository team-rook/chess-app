class AddCounterToGame < ActiveRecord::Migration
  def change
    add_column :games, :move_counter, :string
  end
end
