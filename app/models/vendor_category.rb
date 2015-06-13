class VendorCategory < ActiveRecord::Base
  has_many :Vendor

  searchable do
    text :category
  end

end
