class Fuck < ActiveRecord::Migration[5.2]
  def change
    remove_index :comments, :author_id
    remove_index :comments, :artwork_id
    add_index :comments, :author_id
    add_index :comments, :artwork_id
  end
end
