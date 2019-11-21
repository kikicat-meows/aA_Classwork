class AmendArtworkSharesIndices < ActiveRecord::Migration[5.2]
  def change
    remove_index :artwork_shares, [:artwork_id, :viewer_id]
    remove_index :artwork_shares, :viewer_id
    add_index :artwork_shares, [:viewer_id, :artwork_id], unique: true

  end
end
