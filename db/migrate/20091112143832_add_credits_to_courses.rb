class AddCreditsToCourses < ActiveRecord::Migration
  def self.up
    add_column :courses, :credits, :integer, :default => 0
    Course.all.each do |course|
      course.credits = 4
      course.save
    end
  end

  def self.down
    remove_column :courses, :credits
  end
end
