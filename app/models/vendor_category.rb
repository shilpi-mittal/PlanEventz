class VendorCategory < ActiveRecord::Base
  has_many :VendorSubCategory, dependent: :destroy
end
