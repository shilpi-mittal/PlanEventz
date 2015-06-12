class AddCategoryIdToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :category_id, :integer
    add_index :vendors, :category_id
  end
end
