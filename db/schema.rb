# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091129235319) do

  create_table "course_instances", :force => true do |t|
    t.string   "season"
    t.text     "description"
    t.integer  "course_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start"
    t.date     "end"
  end

  create_table "courses", :force => true do |t|
    t.string   "title",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     :null => false
    t.text     "description", :default => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credits",     :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "username",      :limit => 40, :null => false
    t.string   "realname"
    t.string   "studentnumber"
    t.string   "enc_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
