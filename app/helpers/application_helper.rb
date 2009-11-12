# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    
  def created_time
    temp_time = Time.now
		temp_time.strftime("%d.%m.%Y %H:%M")
  end
  
  def linkkihelppi(fst, snd)
    "Ensimmäinen: #{fst} ja toinen #{snd}"
  end
end
