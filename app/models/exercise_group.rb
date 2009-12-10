class ExerciseGroup < ActiveRecord::Base
  belongs_to  :course_instance
  has_many    :registrations
  has_many    :users, :through => :registrations
  
  validates_numericality_of :course_instance_id, :message => "is not a number"
  validates_presence_of :weekday, :start, :end, :message => "can't be blank"
  validates_associated :course_instance
  validates_format_of :start, :end, :with => /^[\d]{2}|[\d]{2}:[\d]{2}+$/, :message => "is invalid"
  validates_format_of :weekday, :with => /^Mon|Tue|Wed|Thu|Fri+$/, :message => "is invalid"
  
  def name
    "#{weekday} #{start}-#{self.end}"
  end
  
  def full_name
    "#{name} #{place}"
  end
  
end
