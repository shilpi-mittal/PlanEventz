class CreateVendorReviews < ActiveRecord::Migration
  def change
    create_table :vendor_reviews do |t|
      t.belongs_to :vendors, index: true
      t.belongs_to :user, index: true
      t.text :review

      t.timestamps null: false
    end
  end
end
