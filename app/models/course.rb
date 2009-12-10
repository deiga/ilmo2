class Course < ActiveRecord::Base
  
  has_many      :course_instances, :dependent => :destroy
  has_many      :course_categories
  has_many      :categories, :through => :course_categories
  
  default_scope :order => "created_at DESC"
  
  validates_presence_of :title, :description, :credits
  validates_numericality_of :credits, :message => "is not a number"
  validates_uniqueness_of :title

  after_create :update_newsfeed
  
  named_scope :recent, lambda { |*parameters|
      later_than = (parameters.size == 1 ? parameters[0] : 5.months.ago )
      
      {:conditions => ["created_at > ? ", later_than]}
    }

  def self.talk_course_names(courses)
    speak_this = courses.map(&:title).join(". ")
    
    Talker.talk_binary(speak_this)
  end
  
private

  def update_newsfeed
    Newsfeed.course_created(self)
  end
end
