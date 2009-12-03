ActionController::Routing::Routes.draw do |map|

  map.resources :courses, :shallow => true do |course|
    course.resources :course_instances do |ci|
      ci.resources :exercise_groups
    end
  end
  map.resources :users, :except => [:index]
  map.resources :sessions, :only => [:index, :create, :destroy]
  
  map.root :controller => :courses
  map.login "/login", :controller=>:sessions
  map.logout "/logout", :controller=>:sessions, :action=>:destroy
 
 # map.connect ':controller/:action/:id'
 # map.connect ':controller/:action/:id.:format'
end
