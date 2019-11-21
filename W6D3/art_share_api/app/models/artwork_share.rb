# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  favorite   :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#
# Indexes
#
#  index_artwork_shares_on_artwork_id                (artwork_id)
#  index_artwork_shares_on_viewer_id_and_artwork_id  (viewer_id,artwork_id) UNIQUE
#

class ArtworkShare < ApplicationRecord
  validates :artwork_id, :viewer_id, presence: true
  validates_uniqueness_of :artwork_id, :scope => [:viewer_id]

  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :User

  belongs_to :artwork,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :Artwork
end
