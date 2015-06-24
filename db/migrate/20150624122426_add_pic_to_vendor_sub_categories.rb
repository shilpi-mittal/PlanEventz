class AddPicToVendorSubCategories < ActiveRecord::Migration
  def change
    add_column :vendor_sub_categories, :pic, :binary
  end
end
