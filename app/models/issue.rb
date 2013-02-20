class Issue < ActiveRecord::Base
  attr_accessible :body, :id, :movement_id, :title, :user_id
  belongs_to :topics
  belongs_to :users
  has_many :comments

  validates_presence_of :title, :body
  validates_length_of :title, :within => 10...140
  validates_length_of :body, :minimum => 50
end
