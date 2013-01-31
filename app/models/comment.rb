class Comment < ActiveRecord::Base
  attr_accessible :author, :body, :issue_id, :movement_id, :user_id
end
