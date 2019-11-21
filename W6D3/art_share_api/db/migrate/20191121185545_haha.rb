class Haha < ActiveRecord::Migration[5.2]
  def change
    drop_table :likes

    create_table :likes do |t|
      t.integer :user_id, null: false
      ## polymorphic comment_id or artwork_id
      t.references :likeable, polymorphic: true
      t.timestamps
    end
    
    add_index :likes, [:user_id, :likeable_id, :likeable_type], unique: true
  end
end
