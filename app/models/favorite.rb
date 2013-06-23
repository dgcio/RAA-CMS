class Favorite < ActiveRecord::Base
  belongs_to :users

  attr_accessible :topic_id, :user_id

  def self.subscribed(user_id, topic_id)
    f = User.where(:id => user_id).joins(:favorites).where("favorites.topic_id" => topic_id)
    return f.length > 0
  end
end
