class Course < ActiveRecord::Base
  has_many      :course_instances
  
  validates_presence_of :title, :description, :credits
  validates_numericality_of :credits, :message => "is not a number"
#  validates_uniqueness_of :title, :message => "must be unique"
end
