class AddIsVendorFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :is_vendor_flag, :boolean
  end
end
