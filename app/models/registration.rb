class Registration < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise_group
  
  after_create :update_newsfeed
  
  def update_newsfeed
    
  end
  
  private

  def update_newsfeed
    Newsfeed.user_registered_to_group(self)
  end

end
