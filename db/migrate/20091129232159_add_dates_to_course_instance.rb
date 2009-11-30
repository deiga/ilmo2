class AddDatesToCourseInstance < ActiveRecord::Migration
  def self.up
    add_column :course_instances, :start, :date
    add_column :course_instances, :end, :date
  end

  def self.down
    remove_column :course_instances, :end
    remove_column :course_instances, :start
  end
end
