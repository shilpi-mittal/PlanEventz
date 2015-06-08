class AddVendorToVendorRate < ActiveRecord::Migration
  def change
    add_column :vendor_rates, :vendor_id, :integer
    add_index :vendor_rates, :vendor_id
  end
end
