class Comment < ActiveRecord::Base
	belongs_to :issues
	belongs_to :users
	attr_accessible :id, :user_id, :issue_id, :author, :body
end