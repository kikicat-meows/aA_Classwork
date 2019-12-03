class RemoveIndexOnCatId < ActiveRecord::Migration[5.2]
  def change
    remove_index :cat_rental_requests, :cat_id
    add_index :cat_rental_requests, :cat_id, unique: true
  end
end
