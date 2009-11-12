class Course < ActiveRecord::Base
  validates_presence_of :title, :description, :credits
  validates_numericality_of :credits, :on => :create, :message => "is not a number"
#  validates_uniqueness_of :title, :message => "must be unique"
end
