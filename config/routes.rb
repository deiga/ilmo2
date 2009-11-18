ActionController::Routing::Routes.draw do |map|

  map.logout '/sessions/logout', :controller => "sessions", :action => "logout", :conditions => { :method => :get }

  map.resources :courses
  map.resources :users
  map.resources :course_instances
  map.resources :sessions
  
  map.root :controller => :courses, :action => :index
 
 # map.connect ':controller/:action/:id'
 # map.connect ':controller/:action/:id.:format'
end
