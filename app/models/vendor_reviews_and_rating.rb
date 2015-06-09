class VendorReviewsAndRating < ActiveRecord::Base
  validates :review, presence: true,
            length: { minimum: 5 }
  validates :rating, presence: true
  validates :vendor_id, presence: true
  validates :user_id, presence: true
  validates_numericality_of :rating, less_than_or_equal_to: 5

  letsrate_rateable "rating"
  belongs_to :Vendor
  belongs_to :User
end
