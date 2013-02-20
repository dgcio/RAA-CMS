require 'digest/sha2'

class User < ActiveRecord::Base
  has_many :issues
  has_many :topics
  has_many :comments

	attr_accessor :password, :password_confirmation
  attr_accessible :password, :password_confirmation, :admin, :email, :hashed_pwd, :id, :zipcode

  validates_numericality_of :zipcode
  validates_length_of :zipcode, :within => 5...6
  validates_uniqueness_of :email
  validates_length_of :email, :password, :password, :within => 6...32
  validates_presence_of :password, :password_confirmation, :email, :zipcode
  validates_confirmation_of :password, :password_confirmation
 
  before_create do
  	self.hashed_pwd = User.hash_pwd(self.password)
  end

  def self.authenticate(email, password)
  	return nil if email && password == ''
  	u = find_by_email(email)
    return nil if u.blank?
  	return u if u.hashed_pwd == User.hash_pwd(password)
  end
  	
  protected

	def self.hash_pwd(pwd)
		Digest::SHA512.hexdigest(pwd)
	end

end
