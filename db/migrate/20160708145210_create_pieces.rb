class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :type
      t.integer :current_position

      t.integer :user_id
      t.integer :game_id 

      t.timestamps
    end
  end
end
