class CourseInstance < ActiveRecord::Base
  belongs_to  :course
  has_many    :exercise_groups
  
  validates_presence_of :year, :description, :course_id, :message => "can't be blank"
  validates_numericality_of :course_id, :year, :message => "is not a number"
  validates_associated :course
  validates_format_of :year, :with => /^[\d]{4}+$/, :on => :create, :message => "is invalid"
  validates_format_of :season, :with => /^[Ff]all|[Ss]ummer|[Aa]utumn+$/, :message => "is invalid"
  
end