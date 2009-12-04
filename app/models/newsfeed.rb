class Newsfeed < ActiveRecord::Base
  
  default_scope :order => 'updated_at DESC'
  
  named_scope :recent, lambda { |*parameters|
        amount = (parameters.size == 1 ? parameters[0] : 5 )
 
        { :limit => amount }
  }
  
  # Newsfeed.user_created
  def self.user_created(user)
    self.create_newsfeed(user.username + " registered to Ilmo 2.0.")
  end
  
  # Newsfeed.user_registered_to_group
  def self.user_registered_to_group(registration)
    self.create_newsfeed("#{registration.user.username} is attending #{registration.exercise_group.course_instance.course.title}, #{registration.exercise_group.course_instance.season} #{registration.exercise_group.course_instance.start.year}.")
  end
  
  # Newsfeed.course_created
  def self.course_created(course)
    self.create_newsfeed("New course \"" + course.title + "\" is available. Register now!")
  end
  
private
  
  def self.create_newsfeed(message)
    Newsfeed.create(:message => message)
  end
  
end
