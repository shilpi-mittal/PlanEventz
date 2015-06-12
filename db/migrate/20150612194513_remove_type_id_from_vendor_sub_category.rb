class RemoveTypeIdFromVendorSubCategory < ActiveRecord::Migration
  def change
    remove_column :vendor_sub_categories, :vendor_category_id, :integer
  end
end
