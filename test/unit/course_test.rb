require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "Valid course with title and description" do  
    course = Course.new(:title => "TestCourse", :description => "Smith")  
    assert_equal 'TestCourse', course.title
  end  
end
