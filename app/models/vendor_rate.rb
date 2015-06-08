class VendorRate < ActiveRecord::Base
  letsrate_rateable "rate"
  belongs_to :Vendor
end