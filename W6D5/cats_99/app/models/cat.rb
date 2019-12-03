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
require 'date'


class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper
  validates :birth_date, :color, :name, :sex, presence: true

  COLOR = ["black", "white", "orange", "grey", "brown"]
  validates :color, inclusion: { in: COLOR, message: "%{value} is not a valid color"}

  def age
    time_elapse = Date.today.to_time - self.birth_date.to_time
    
    from_time = Time.now - time_elapse
    @age = time_ago_in_words(from_time)
    @age
  end

  has_many :rental_requests,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :CatRentalRequest,
    dependent: :destroy

end
