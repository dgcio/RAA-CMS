class RenameMovementIdtoTopicIdInIssues < ActiveRecord::Migration
  def up
  	rename_column :issues, :movement_id, :topic_id
  end

  def down
  end
end
