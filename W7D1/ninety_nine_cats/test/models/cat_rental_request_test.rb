# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  end_date   :date             not null
#  start_date :date             not null
#  status     :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cat_id     :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_cat_rental_requests_on_cat_id   (cat_id)
#  index_cat_rental_requests_on_user_id  (user_id)
#

require 'test_helper'

class CatRentalRequestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
