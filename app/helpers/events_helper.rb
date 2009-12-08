module EventsHelper
  
  def event_text(event)
    case event[:type]
    when 'NewCourseEvent'       then "#{link_to h(event.course.title), course_url(event.course)} has been added to the course catalog!"
    when 'NewUserEvent'         then "#{h(event.user.username)} has joined ilmo2.0!"
    when 'NewRegistrationEvent' then "#{h(event.user.username)} is attending #{link_to h(event.course.title), course_url(event.course)}"
    end
  end
end
