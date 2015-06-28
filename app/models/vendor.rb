class Vendor < ActiveRecord::Base
  belongs_to :VendorCategory
  belongs_to :VendorSubCategory
  has_many :VendorReviewsAndRating

  searchable do
    text :name, :description, :location, :address
  end

  validates :name, presence: true
  validates :location, presence: true
  validates :phone, presence: true
  validates :category_id, presence: true

end
