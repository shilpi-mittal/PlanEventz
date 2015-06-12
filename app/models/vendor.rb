class Vendor < ActiveRecord::Base
  belongs_to :VendorCategory
  belongs_to :VendorSubCategory
  has_many :VendorReviewsAndRating
end
