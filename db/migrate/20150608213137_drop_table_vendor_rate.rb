class DropTableVendorRate < ActiveRecord::Migration
  def change
    drop_table :vendor_rates
  end
end
