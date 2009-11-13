ActionController::Routing::Routes.draw do |map|
  #map.resources :courses
  map.resources :users
  map.resources :sessions, :collection => { :logout => :get }
  
  map.logout '/sessions/logout', :controller => :sessions, :action => :destroy, :method => :delete
  map.root :controller => :courses, :action => :index
 
 # map.connect ':controller/:action/:id'
 # map.connect ':controller/:action/:id.:format'
end
