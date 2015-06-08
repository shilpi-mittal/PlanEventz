class Vendor < ActiveRecord::Base
  belongs_to :VendorSubCategory
  # has_many :VendorReview, dependent: destroy
  has_many :VendorRate
end
