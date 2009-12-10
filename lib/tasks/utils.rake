namespace :utils do
  namespace :seed do
    
    descr = %{Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.}
      
    desc "Seed application with everything"
    task :all => [:roles, :categories, :users, :courses, :instances, :groups, :registrations]

    desc "Seed application with user roles"
    task :roles => :environment do
      Role.create :name => 'admin'
    end
    
    desc "Seed application with course categories"
    task :categories => :environment do
      Category.create :name => 'Basic studies'
      Category.create :name => 'Intermediate studies'
      Category.create :name => 'Advanced studies'
      Category.create :name => 'Others'
    end
    
    desc "Seed application with users"
    task :users => :environment do
      User.create :username => 'deiga', :password => 'tester11', :email => 'timo.sand@helsinki.fi'
      1.upto(19) { |i| User.create :username => "tuser#{i}", :password => 'tester11' }
    end
    
    desc "Seed application with courses"
    task :courses => [:environment, :categories] do
      1.upto(20) {|i| Course.create :title => "Course#{i}", :description => descr}
      Course.all.each do |course|
        if course.id.modulo(4) == 0
          course.categories << Category.find(3)
        elsif course.id.modulo(3) == 0
          course.categories << Category.find(2)
        elsif course.id.even?
          course.categories << Category.find(1)
        end
      end
    end
    
    desc "Seed application with course instances"
    task :instances => [:environment, :courses] do
      Course.all.each do |course|
        course.course_instances.create :season => 'Fall', :start => "2009-09-01", :end => "2009-12-18", :description => descr
        course.course_instances.create :season => 'Autumn', :start => "2010-01-18", :end => "2010-03-05", :description => descr
        course.course_instances.create :season => 'Autumn', :start => "2010-03-15", :end => "2010-05-07", :description => descr
        course.course_instances.create :season => 'Summer', :start => "2010-06-01", :end => "2010-09-01", :description => descr
      end
    end
    
    desc "Seed application with exercise groups"
    task :groups => :environment do
      CourseInstance.all.each do |ci|
        ci.exercise_groups.create :weekday => "Mon", :start => "8", :end => "10", :place => "DK117"
        ci.exercise_groups.create :weekday => "Tue", :start => "10", :end => "12", :place => "DK117"
        ci.exercise_groups.create :weekday => "Wed", :start => "12", :end => "14", :place => "BK117"
        ci.exercise_groups.create :weekday => "Thu", :start => "14", :end => "16", :place => "DK117"
        ci.exercise_groups.create :weekday => "Fri", :start => "12", :end => "14", :place => "CK111"
      end
    end
    
    desc "Seed application with registrations"
    task :registrations => :environment do
      User.all.each do |user|
        ExerciseGroup.all.each do |group|
          group.users << user
        end
      end
    end
    
  end
end