class RemoveUnicodeTable < ActiveRecord::Migration
  def change
  	remove_column :pieces, :piece_unicode, :string
  end
end
