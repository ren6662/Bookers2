class RenameBodColumnToBooks < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :bod ,:body
  end
end
