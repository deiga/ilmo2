class CourseCategory < ActiveRecord::Base
  belongs_to :course
  belongs_to :category
  
  validates_associated :course, :category
end
