# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  description :text
#  name        :string           not null
#  sex         :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_cats_on_user_id  (user_id)
#

require 'test_helper'

class CatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
