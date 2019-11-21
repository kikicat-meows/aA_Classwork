# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  likeable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  likeable_id   :bigint
#  user_id       :integer          not null
#
# Indexes
#
#  index_likes_on_likeable_type_and_likeable_id              (likeable_type,likeable_id)
#  index_likes_on_user_id_and_likeable_id_and_likeable_type  (user_id,likeable_id,likeable_type) UNIQUE
#

class Like < ApplicationRecord
  validates_uniqueness_of :user_id, scope: [:likeable_id, :likeable_type]

  belongs_to :likeable, polymorphic: true

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
