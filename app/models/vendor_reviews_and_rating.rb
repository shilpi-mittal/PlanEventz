class VendorReviewsAndRating < ActiveRecord::Base
  letsrate_rateable "rating"
  belongs_to :Vendor
  belongs_to :User
end
