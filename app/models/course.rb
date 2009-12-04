class Course < ActiveRecord::Base
  
  has_many      :course_instances, :dependent => :destroy
  
  validates_presence_of :title, :description, :credits
  validates_numericality_of :credits, :message => "is not a number"
#  validates_uniqueness_of :title, :message => "must be unique"

  def self.talk_course_names(courses)
    speak_this = courses.map(&:title).join(". ")
    
    Talker.talk_binary(speak_this)
  end
end
