class Comment < ActiveRecord::Base
  attr_accessible :author, :body, :issue_id, :movement_id, :user_id

  validates_presence_of :body
  validates_length_of :body, :within => 10...3000
end
