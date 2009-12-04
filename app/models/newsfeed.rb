class Newsfeed < ActiveRecord::Base
  
  default_scope :order => 'created_at DESC'
  named_scope :later_than, lambda { |later| 
    { :conditions => [ "created_at > ?", later ] }
  }
  
  # Newsfeed.user_created
  def self.user_created(user)
    create :message => "User #{user.username} registered to Ilmo 2.0"
  end
  
  # Newsfeed.user_registered_to_group
  def self.user_registered_to_group(registration)
    create :message => "User #{registration.user.username} registered to group #{registration.exercise_group.weekday} #{registration.exercise_group.start} - #{registration.exercise_group.end} of <strong>#{registration.exercise_group.course_instance.course.title} - #{registration.exercise_group.course_instance.season} #{registration.exercise_group.course_instance.start.year}</strong>"
  end
  
end
