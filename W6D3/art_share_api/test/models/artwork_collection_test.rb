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

require 'test_helper'

class ArtworkCollectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
