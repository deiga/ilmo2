class Category < ActiveRecord::Base
  has_many    :courses, :through => :course_categories
  has_many    :course_categories
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
end
