class Feedback < ActiveRecord::Base
  belongs_to :course_instance
  
  validates_presence_of :message
  
end
