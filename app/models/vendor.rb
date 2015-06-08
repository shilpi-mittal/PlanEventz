class Vendor < ActiveRecord::Base
  belongs_to :VendorSubCategory
  has_many :VendorReviewsAndRating
end
