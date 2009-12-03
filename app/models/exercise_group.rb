class ExerciseGroup < ActiveRecord::Base
  belongs_to  :course_instance
  has_many    :user_in_groups
  has_many    :users, :through => :user_in_groups
  
  validates_numericality_of :course_instance_id, :message => "is not a number"
  validates_presence_of :weekday, :start, :end, :message => "can't be blank"
  validates_associated :course_instance
  validates_format_of :start, :end, :with => /^[\d]{2}|[\d]{2}:[\d]{2}+$/, :message => "is invalid"
end
