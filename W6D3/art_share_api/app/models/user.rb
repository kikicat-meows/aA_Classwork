# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username) UNIQUE
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy

  has_many :artworks_viewed,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :shared_artworks, through: :artworks_viewed, source: :artwork

  has_many :comments,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: 'Comment',
    dependent: :destroy

  has_many :artworks_commented_on,
    through: :comments,
    source: :artwork

  


end
