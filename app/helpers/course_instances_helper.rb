module CourseInstancesHelper
  
  def get_season(month)
    if month.to_i <= 5
      'Autumn'
    elsif month.to_i > 5 && month.to_i < 9
      'Summer'
    else
      'Fall'
    end
  end
  
  def format_year(date_array)
    date_array[:year]+"-"+date_array[:month]+"-"+date_array[:day]
  end
  
end
