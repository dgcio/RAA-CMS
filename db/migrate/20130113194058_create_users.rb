class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :email
      t.integer :zipcode
      t.text :hashed_pwd
      t.boolean :admin

      t.timestamps
    end
  end
end
