class Vendor < ActiveRecord::Base
  belongs_to :VendorCategory
  belongs_to :VendorSubCategory
  has_many :VendorReviewsAndRating

  searchable do
    text :name, :description, :location, :address
  end

  validates :name, presence: true
  validates :location, presence: true
  validates :phone, presence: true,
            numericality: { only_integer: true },
            length: {minimum: 10, maximum: 11}
  validates :category_id, presence: true
  validates :events_handled, numericality: { only_integer: true },
            allow_blank: true

end
