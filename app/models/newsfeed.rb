class Newsfeed < ActiveRecord::Base
  
  default_scope :order => 'created_at DESC'
  named_scope :later_than, lambda { |later| 
    { :conditions => [ "created_at > ?", later ] }
  }
  
  # Newsfeed.user_registered
  def self.user_registered(user)
    create :message => "User #{user.username} registered to Ilmo 2.0"
  end
end
