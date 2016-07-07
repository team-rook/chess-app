class AddUserIDsToGames < ActiveRecord::Migration
  def change
    add_column :games, :white_user_id, :integer
    add_column :games, :black_user_id, :integer
  end
end
