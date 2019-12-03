# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  end_date   :date             not null
#  start_date :date             not null
#  status     :string           default("pending"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cat_id     :integer          not null
#
# Indexes
#
#  index_cat_rental_requests_on_cat_id  (cat_id)
#

class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validate :validate_end_date
  ### Removed Uniqueness Validation, now things work

  def valid_end_date
    self.end_date - self.start_date > 0 ? true : false
  end

  def validate_end_date
    if !valid_end_date
      errors.add(:end_date, "cannot be before start date")
    end
  end
  
  def overlapping_requests
    # A cat rental request starting on 02/25/17 and ending on 02/27/17.
    # There is a overlap if another cat rental also starts on the same day (02/25/17).
    # There is a overlap if another cat rental request starts on the return day (02/27/17).
    # There is a overlap if another cat rental request starts between the start and end dates (02/26/17).
    ### no overlaps if start_date of request is after current end_date, end_date of request is before current start_date
    CatRentalRequest.where(cat_id: cat_id)
                    .where.not(id: self.id)
                    .where.not("end_date < :start_date AND start_date > :end_date", start_date: start_date, end_date: end_date)

  end

  def overlapping_approved_requests
    overlapping_requests.where("status = 'APPROVED'")
  end

  def overlapping_denied_requests
    
  end

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat
end
