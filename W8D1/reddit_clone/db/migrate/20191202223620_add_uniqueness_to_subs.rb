class AddUniquenessToSubs < ActiveRecord::Migration[5.2]
  def change
    remove_column :subs, :title
    add_column :subs, :title, :string, null: false

    add_index :subs, :title, unique: true
  end
end
