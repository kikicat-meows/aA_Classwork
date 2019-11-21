class AddingFavoritesToStuff < ActiveRecord::Migration[5.2]
  def change
    ### add to artwork for owner likes
    ### add to shared artwork for viewer likes
    add_column :artworks, :favorite, :boolean
    add_column :artwork_shares, :favorite, :boolean
  end
end
