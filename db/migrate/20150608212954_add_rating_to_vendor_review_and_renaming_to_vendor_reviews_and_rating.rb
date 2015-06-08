class AddRatingToVendorReviewAndRenamingToVendorReviewsAndRating < ActiveRecord::Migration
  def change
    add_column :vendor_reviews, :rating, :integer
    rename_table :vendor_reviews, :vendor_reviews_and_rating
  end
end
