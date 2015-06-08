class RenameVendorReviewsAndRatingToVendorReviewsAndRatings < ActiveRecord::Migration
  def change
    rename_table :vendor_reviews_and_rating, :vendor_reviews_and_ratings
  end
end
