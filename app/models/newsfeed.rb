class Newsfeed < ActiveRecord::Base
  
  default_scope :order => 'created_at DESC'
  named_scope :later_than, lambda { |later| 
    { :conditions => [ "created_at > ?", DateTime.parse(later.to_s) ] }
  }
  
  # Newsfeed.user_created
  def self.user_created(user)
    create :message => "User #{user.username} registered to Ilmo 2.0"
  end
  
  # Newsfeed.user_registered_to_group
  def self.user_registered_to_group(registration)
    template = "#{registration.user.username} is attending <strong><%= link_to #{registration.exercise_group.course_instance.course.title}, course_instance_url(#{registration.exercise_group.course_instance}) %></strong>"
    create :message => template
  end
  
  # Newsfeed.course_created
  def self.course_created(course)
    create :message => "'#{course.title}' was added to the course catalog"
  end
  
end
