class RemoveIssueIdAndMainTypeFromFollowings < ActiveRecord::Migration
  def up
  	add_column :followings, :title, :text
  	add_column :followings, :body, :text
  	remove_columns :followings, :issue_id, :main_type
  end

  def down
  end
end
