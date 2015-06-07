class Vendor < ActiveRecord::Base
  belongs_to :VendorSubCategory
  has_many :VendorReview, dependent: destroy
end
