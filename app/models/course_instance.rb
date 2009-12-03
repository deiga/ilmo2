class CourseInstance < ActiveRecord::Base
  belongs_to  :course
  has_many    :exercise_groups, :dependent => :destroy
  
  validates_numericality_of :course_id, :message => "is not a number"
  validates_associated :course
  validates_format_of :season, :with => /^[Ff]all|[Ss]ummer|[Aa]utumn+$/, :message => "is invalid"
  
  named_scope :find_by_course_in_order, lambda { |course_id|
     { :conditions => { :course_id => course_id }, :order => "start, season ASC" }
  }
  
end