class RenameRateColumnOfVendorRateToRating < ActiveRecord::Migration
  def change
    rename_column :vendor_rates, :rate, :rating
  end
end
