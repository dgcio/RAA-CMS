class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :issue_id
      t.integer :movement_id
      t.integer :user_id
      t.text :main_type

      t.timestamps
    end
  end
end
