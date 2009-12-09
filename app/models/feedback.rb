class Feedback < ActiveRecord::Base
  belongs_to :course_instance
  
  validates_presence_of :message
  
  default_scope :order => 'updated_at DESC'
  
  named_scope :course, lambda { |ci_id| 
        { :conditions => { :course_instance_id => ci_id }, :order => 'updated_at DESC' }
  }
  
end
