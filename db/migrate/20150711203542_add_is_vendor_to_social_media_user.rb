class AddIsVendorToSocialMediaUser < ActiveRecord::Migration
  def change
    add_column :social_media_users, :is_vendor, :boolean
  end
end
