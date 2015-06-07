class CreateVendorSubCategories < ActiveRecord::Migration
  def change
    create_table :vendor_sub_categories do |t|
      t.belongs_to :vendor_category, index: true
      t.string :sub_category

      t.timestamps null: false
    end
  end
end
