class CreatePageHit < ActiveRecord::Migration
  def change
    create_table :page_hits do |t|
      t.string :url
      t.integer :count

      t.timestamps null: false
    end
  end
end
