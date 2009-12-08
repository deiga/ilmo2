class NewRegistrationEvent < Event
  validates_presence_of :user_id, :course_id
end