# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  description :string
#  name        :string           not null
#  sex         :string(1)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
