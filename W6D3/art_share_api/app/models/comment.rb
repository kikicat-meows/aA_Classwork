# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :integer          not null
#  author_id  :integer          not null
#
# Indexes
#
#  index_comments_on_artwork_id  (artwork_id)
#  index_comments_on_author_id   (author_id)
#

class Comment < ApplicationRecord

    validates :author_id, :artwork_id, :body, presence: true


    belongs_to :author,
      primary_key: :id,
      foreign_key: :author_id,
      class_name: 'User'

    belongs_to :artwork,
      primary_key: :id,
      foreign_key: :artwork_id,
      class_name: 'Artwork'




    


end
