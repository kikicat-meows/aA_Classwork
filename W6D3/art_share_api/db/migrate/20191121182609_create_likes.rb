class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      ## polymorphic comment_id or artwork_id
      t.references :object_liked, polymorphic: true
      t.timestamps
    end
  end
end
