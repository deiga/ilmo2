ActionController::Routing::Routes.draw do |map|
  map.resources :courses
  map.resources :users
  map.resources :sessions
  
  map.root :controller => :courses, :action => :index
  map.connect ':controller/:action/:id'
 # map.connect ':controller/:action/:id.:format'
end
