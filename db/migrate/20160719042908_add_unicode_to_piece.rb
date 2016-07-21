class AddUnicodeToPiece < ActiveRecord::Migration
  def change
   add_column :pieces, :piece_unicode, :string
  end
end
