class AddCoverPicToVendor < ActiveRecord::Migration
  def change
    add_column :vendors, :cover_pic, :binary
  end
end
