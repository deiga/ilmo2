module EventsHelper
  
  def event_text(event)
    case event[:type]
    when 'NewCourseEvent'       then ""
    when 'NewUserEvent'         then ""
    when 'NewRegistrationEvent' then ""
    end
  end
end
