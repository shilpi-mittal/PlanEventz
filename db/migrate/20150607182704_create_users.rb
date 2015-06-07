class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname, :null => false
      t.string :lastname, :null => true
      t.string :email, :null => true
      t.string :password, :null => true

      t.timestamps null: false
    end
  end
end
