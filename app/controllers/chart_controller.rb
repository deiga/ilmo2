class ChartController < ApplicationController
	def index
		#get the swfchart object out of the session and render
		swf = session[:swfchart]
		
		render :text => swf.get_source_xml unless swf.nil?
	end
end