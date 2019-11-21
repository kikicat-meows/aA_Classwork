# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  favorite   :boolean
#  img_url    :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer          not null
#
# Indexes
#
#  index_artworks_on_artist_id            (artist_id)
#  index_artworks_on_title_and_artist_id  (title,artist_id) UNIQUE
#

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

  has_many :comments,
    primary_key: :id,
    foreign_key: :artwork_id,
    class_name: 'Comment',
    dependent: :destroy

  has_many :commenters,
    through: :comments,
    source: :author

  has_many :likes, as: :likeable, dependent: :destroy

  has_many :users_liked, through: :likes, source: :user

end
