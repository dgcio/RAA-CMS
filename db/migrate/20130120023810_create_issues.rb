class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :id
      t.integer :user_id
      t.integer :movement_id
      t.text :title
      t.text :body

      t.timestamps
    end
  end
end
