class RemoveYearsFromCourseInstance < ActiveRecord::Migration
  def self.up
    remove_column :course_instances, :year
  end

  def self.down
  end
end
