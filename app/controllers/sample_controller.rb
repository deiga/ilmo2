class SampleController < ApplicationController

  def index
    @Description = "Users Chart"
    @alluser=User.find(:all)
    @user=User.find(:all, :conditions=>["username LIKE ? ", 'user'])
    @designer=User.find(:all, :conditions=>["username LIKE ?", 'designer'])
    @swf = SWFChart.new
    session[:swfchart] = @swf
    @swf.data_array = Array.new
    @swf.data_array[0] = [nil]
    @swf.data_array[1] = ['']
    for user in @alluser
      @swf.data_array[0] << "users"
      @swf.data_array[1] << @user.size
      @swf.data_array[0] << "designers"
      @swf.data_array[1] << @designer.size
    end
    @swf.chart_type = "3d pie"
    @swf.chart_rect = { :x => '150',:width => '350',:height => '150'}
    @swf.legend_rect = { :x => 10, :y => 10, :width => 50, :height => 350}
  end
end 