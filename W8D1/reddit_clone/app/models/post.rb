# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :string
#  subject    :string           not null
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer          not null
#  sub_id     :integer          not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#  index_posts_on_sub_id     (sub_id)
#

class Post < ApplicationRecord
    validates :subject, :author_id, :sub_id, presence: true

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :sub,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :Sub
            
end
