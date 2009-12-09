
descr = %{Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.}
  
puts "Creating 13 courses!"

1.upto(13) {|i| Course.create :title => "Course#{i}", :description => descr}

Course.all.each do |course|
  course.course_instances.create :season => 'Summer', :start => "2009-06-01", :end => "2009-09-01", :description => descr
end

CourseInstance.all.each do |ci|
  ci.exercise_groups.create :weekday => "Wed", :start => "10", :end => "12", :place => "DK117"
end

user = User.create :username => 'deiga', :password => 'tester11', :email => 'timo.sand@helsinki.fi'

Role.create :name => 'admin'

basic = Category.create :name => 'Basic studies'
inter = Category.create :name => 'Intermediate studies'
advanced = Category.create :name => 'Advanced studies'
other = Category.create :name => 'Others'

1.upto(13) { 
  |i| c = Course.find i
  if i.even?
    c.categories << basic
  else
    c.categories << inter
  end
  }

user.roles << Role.admin_role

puts "Seed done!"