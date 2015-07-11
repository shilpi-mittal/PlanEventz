class CreateSocialMediaUsers < ActiveRecord::Migration
  def change
    create_table :social_media_users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :profile_picture
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps null: false
    end
  end
end
