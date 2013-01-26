class Following < ActiveRecord::Base
	has_many :movements
	has_many :issues, :through => :movements
  attr_accessible :main_id, :main_type, :user_id
end
