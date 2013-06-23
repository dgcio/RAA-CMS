class Topic < ActiveRecord::Base
	belongs_to :users
  has_many :issues

  attr_accessible :body, :id, :title, :user_id

  validates_presence_of :title, :body
  validates_length_of :title, :within => 10...140
  validates_length_of :body, :minimum => 50
end
