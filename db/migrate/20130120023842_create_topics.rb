class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :id
      t.integer :user_id
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
