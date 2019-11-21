# == Schema Information
#
# Table name: artwork_collections
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_artwork_collections_on_artwork_id              (artwork_id)
#  index_artwork_collections_on_user_id_and_artwork_id  (user_id,artwork_id) UNIQUE
#

class ArtworkCollection < ApplicationRecord
  validates_uniqueness_of :user_id, scope: :artwork_id

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork
end
