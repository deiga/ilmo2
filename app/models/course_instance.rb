class CourseInstance < ActiveRecord::Base
  belongs_to  :course
  has_many    :exercise_groups
  
  validates_presence_of :year, :season, :description, :course_id, :message => "can't be blank"
  validates_numericality_of :course_id, :year, :message => "is not a number"
  validates_associated :course
  
end