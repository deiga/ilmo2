class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  
  default_scope :order => "updated_at DESC"
  named_scope :current_events, :order => "created_at DESC", :include => [:user, :course]
end
