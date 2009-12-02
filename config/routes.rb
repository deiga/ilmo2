ActionController::Routing::Routes.draw do |map|

  map.logout '/sessions/logout', :controller => "sessions", :action => "logout", :conditions => { :method => :get }

  map.resources :courses do |courses|
    courses.resources :instances, :controller => 'course_instances' do |cis|
      cis.resources :groups, :controller => 'exercise_groups'
    end
  end
  map.resources :users, :except => [:index]
  map.resources :sessions, :only => [:index, :create, :destroy]
  
  map.root :controller => :courses, :action => :index
 
 # map.connect ':controller/:action/:id'
 # map.connect ':controller/:action/:id.:format'
end
