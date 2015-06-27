class VendorSubCategory < ActiveRecord::Base
  has_many :Vendor

  # searchable do
  #   text :sub_category
  # end

end
