class AddPicToVendorCategories < ActiveRecord::Migration
  def change
    add_column :vendor_categories, :pic, :binary
  end
end
