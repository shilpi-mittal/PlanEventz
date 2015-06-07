class VendorSubCategory < ActiveRecord::Base
  belongs_to :VendorCategory
  has_many :Vendor, dependent: destroy
end
