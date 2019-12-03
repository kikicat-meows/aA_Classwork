# == Schema Information
#
# Table name: subs
#
#  id          :bigint           not null, primary key
#  description :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_subs_on_title    (title) UNIQUE
#  index_subs_on_user_id  (user_id)
#

class Sub < ApplicationRecord
    validates :title, :description, :user_id, presence: true
    validates :title, uniqueness: true

    belongs_to :moderator,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User,
        inverse_of: :subs

    has_many :posts,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :Post,
        inverse_of: :sub
    
end
