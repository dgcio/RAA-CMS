class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :issue_id
      t.integer :movement_id
      t.text :author
      t.text :body

      t.timestamps
    end
  end
end
