class Course < ActiveRecord::Base
  validates_presence_of :title, :description
#  validates_uniqueness_of :title, :message => "must be unique"
end
