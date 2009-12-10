ActionController::Routing::Routes.draw do |map|

  map.resources :users, :except => [:index]
  map.resources :sessions, :only => [:index, :create, :destroy]
  map.resources :chart, :only => [:index]
  map.resources :sample, :only => [:index]
  map.resources :registrations
  map.resource :newsfeed, :controller => :newsfeed
  map.resources :feedbacks
  
  map.resources :courses, :shallow => true do |course|
    course.resources :course_instances, :has_many => :feedbacks do |ci|
      ci.resources :exercise_groups 
    end
  end
  
  map.namespace(:admin) do |admin|
    admin.resources :users, :active_scaffold => true
    admin.resources :courses, :active_scaffold => true
    admin.resources :course_instances, :active_scaffold => true
    admin.resources :exercise_groups, :active_scaffold => true
    admin.resources :roles, :active_scaffold => true
    admin.resources :rights, :active_scaffold => true
    admin.resources :registrations, :active_scaffold => true
    admin.resources :categories, :active_scaffold => true
    admin.resources :course_categories, :active_scaffold => true
    admin.resources :news, :active_scaffold => true
    admin.resource  :mailer, :controller => :mailer
  end
  
  map.resource :admin, :controller => :admin  
  
  map.login "/login", :controller=>:sessions
  map.logout "/logout", :controller=>:sessions, :action=>:destroy
  
  map.root :controller => :courses
 
end
