class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :main_id
      t.integer :user_id
      t.text :main_type

      t.timestamps
    end
  end
end
