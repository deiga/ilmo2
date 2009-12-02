ActionController::Routing::Routes.draw do |map|

  map.logout '/sessions/logout', :controller => "sessions", :action => "logout", :conditions => { :method => :get }

  map.resources :courses do |courses|
    courses.resources :instances, :controller => 'course_instances' do |cis|
      cis.resources :exercise_groups
    end
  end
  map.resources :users
  map.resources :sessions
  
  map.root :controller => :courses, :action => :index
 
 # map.connect ':controller/:action/:id'
 # map.connect ':controller/:action/:id.:format'
end
