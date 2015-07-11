class RenameSocialMediaUserToUser < ActiveRecord::Migration
  def change
  	rename_table :social_media_users, :users
  end
end
