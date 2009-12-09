class CourseInstance < ActiveRecord::Base
  belongs_to  :course
  has_many    :exercise_groups, :dependent => :destroy
  has_many    :feedbacks, :dependent => :destroy
  
  validates_numericality_of :course_id, :message => "is not a number"
  validates_associated :course
  validates_format_of :season, :with => /^[Ff]all|[Ss]ummer|[Aa]utumn+$/, :message => "is invalid"
  
  named_scope :find_by_course_in_order, lambda { |course_id|
     { :conditions => { :course_id => course_id }, :order => "start, season ASC" }
   }
  
  def registered_users
    exercise_groups.map{|g| g.users}.flatten.uniq
  end
  
  def allow_multiple_registrations?
    max_exercise_groups && max_exercise_groups > 1
  end
  
end