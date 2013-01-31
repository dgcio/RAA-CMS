class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.integer :id
      t.integer :user_id
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
