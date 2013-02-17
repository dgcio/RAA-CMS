class RemoveMovementIdFromComments < ActiveRecord::Migration
  def up
  	remove_column :comments, :movement_id
  end

  def down
  end
end
