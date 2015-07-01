class User < ActiveRecord::Base
  has_many :Vendors
  has_many :VendorReviewsAndRating
  letsrate_rater
end
