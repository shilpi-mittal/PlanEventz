class RenameVendorsIdColumnOfVendorReviewsAndRatingsToVendorId < ActiveRecord::Migration
  def change
    rename_column :vendor_reviews_and_ratings, :vendors_id, :vendor_id
  end
end