class Movement < ActiveRecord::Base
	has_many :issues
	belongs_to :followings
	belongs_to :users
	has_many :comments

  attr_accessible :body, :id, :title, :user_id

  validates_presence_of :title, :body
  validates_length_of :title, :within => 10...140
  validates_length_of :body, :minimum => 50
end
