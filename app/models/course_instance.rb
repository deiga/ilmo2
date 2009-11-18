class CourseInstance < ActiveRecord::Base
  belongs_to  :course
  has_many    :exercise_groups
  
  validates_presence_of :title, :description, :course_id, :message => "can't be blank"
  validates_uniqueness_of :title, :message => "must be unique"
  validates_numericality_of :course_id, :message => "is not a number"
  validates_associated :course
  
end
