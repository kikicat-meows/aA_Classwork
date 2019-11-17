# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_shortened_urls_on_short_url  (short_url) UNIQUE
#  index_shortened_urls_on_user_id    (user_id)
#

class ShortenedUrl < ApplicationRecord
  validates :short_url, uniqueness: true
  validates :long_url, presence: true

  belongs_to :submitted_user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end
