class UserInGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise_group
end
