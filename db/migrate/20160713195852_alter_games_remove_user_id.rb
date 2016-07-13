class AlterGamesRemoveUserId < ActiveRecord::Migration
  def change
    remove_column :games, :user_id, :integer
  end
end
