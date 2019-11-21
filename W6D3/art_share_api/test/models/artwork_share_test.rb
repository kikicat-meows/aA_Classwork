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

require 'test_helper'

class ArtworkShareTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
