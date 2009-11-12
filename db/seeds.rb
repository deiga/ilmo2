nr_of_courses = ENV['courses']
delete = ENV['del']

descr = %{Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.}
  
if delete != nil
  Course.delete_all
end

puts "Creating #{nr_of_courses} courses!"

1.upto(nr_of_courses) {|i| Course.create :title => "Course#{i}", :description => descr}
