ActionController::Routing::Routes.draw do |map|

  map.resources :users, :except => [:index]
  map.resources :sessions, :only => [:index, :create, :destroy]
  map.resources :registration
  map.resource :newsfeed, :controller => :newsfeed
  
  map.resources :courses, :shallow => true do |course|
    course.resources :course_instances do |ci|
      ci.resources :exercise_groups
    end
  end
  
  map.namespace(:admin) do |admin|
    admin.resources :users, :active_scaffold => true
    admin.resources :courses, :active_scaffold => true
    admin.resources :course_instances, :active_scaffold => true
    admin.resources :exercise_groups, :active_scaffold => true
    admin.resource  :mailer, :controller => :mailer
  end
  
  map.resource :admin, :controller => :admin  
  
  map.login "/login", :controller=>:sessions
  map.logout "/logout", :controller=>:sessions, :action=>:destroy
  
  map.root :controller => :courses
 
end
