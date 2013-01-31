class Following < ActiveRecord::Base
	belongs_to :users
	has_many :issues
	has_many :movements
	
  attr_accessible :issue_id, :movement_id, :main_type, :user_id
end
