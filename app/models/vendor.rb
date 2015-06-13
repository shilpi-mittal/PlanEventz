class Vendor < ActiveRecord::Base
  belongs_to :VendorCategory
  belongs_to :VendorSubCategory
  has_many :VendorReviewsAndRating

  searchable do
    text :name, :description, :location, :address
  end

end
