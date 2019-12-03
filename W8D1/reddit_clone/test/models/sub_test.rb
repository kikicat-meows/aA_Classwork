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

require 'test_helper'

class SubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
