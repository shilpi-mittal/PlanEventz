class RemoveArrangementsFromVendors < ActiveRecord::Migration
  def change
    remove_column :vendors, :arrangements
  end
end
