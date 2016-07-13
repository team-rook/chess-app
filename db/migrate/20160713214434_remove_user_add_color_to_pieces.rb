class RemoveUserAddColorToPieces < ActiveRecord::Migration
  def change
    remove_column :pieces, :user_id, :integer
    add_column :pieces, :color, :string
  end
end
