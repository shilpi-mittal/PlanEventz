class CreateVendorRate < ActiveRecord::Migration
  def change
    create_table :vendor_rates do |t|
      t.integer :rate
    end
  end
end
