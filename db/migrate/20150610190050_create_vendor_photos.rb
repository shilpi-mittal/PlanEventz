class CreateVendorPhotos < ActiveRecord::Migration
  def change
    create_table :vendor_photos do |t|
      t.binary :photo
      t.text :description
      t.string :tag
      t.string :string

      t.timestamps null: false
    end
  end
end
