class AlterPiecesAddColor < ActiveRecord::Migration
  def change
    remove_column :pieces, :type, :string
    add_column :pieces, :color, :string
  end
end
