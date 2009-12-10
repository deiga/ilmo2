class News < ActiveRecord::Base
  
  validates_presence_of :head, :message
  
  default_scope :order => 'updated_at DESC'
  
  named_scope :recent, lambda { |*parameters|
        amount = (parameters.size == 1 ? parameters[0] : 5 )
 
        { :limit => amount }
  }
  
end
