class AddArrangementsToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :arrangements, :integer
  end
end
