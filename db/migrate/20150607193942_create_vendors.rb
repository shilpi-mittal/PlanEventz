class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.belongs_to :vendor_sub_category, index: true
      t.string :name
      t.string :location
      t.text :address
      t.string :phone
      t.text :description
      t.string :website

      t.timestamps null: false
    end
  end
end
