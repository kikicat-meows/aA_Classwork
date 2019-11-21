class Artwork < ApplicationRecord
  # validates_uniqueness_of :artist_id, :scope => [:title]
  validates :artist_id, uniqueness: {scope: :title}
  validates :title, :artist_id, :img_url, presence: true

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artworks_shared,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :viewers, through: :artworks_shared, source: :viewer
end
