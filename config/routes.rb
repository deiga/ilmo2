ActionController::Routing::Routes.draw do |map|
  map.resources :courses
  map.root :controller => :courses, :action => :index
  map.connect ':controller/:action/:id'
 # map.connect ':controller/:action/:id.:format'
end
