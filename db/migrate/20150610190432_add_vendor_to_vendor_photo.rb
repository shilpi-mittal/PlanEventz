class AddVendorToVendorPhoto < ActiveRecord::Migration
  def change
    add_column :vendor_photos, :vendor_id, :integer
    add_index :vendor_photos, :vendor_id
  end
end
