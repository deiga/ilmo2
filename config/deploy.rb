set :application, "ilmo2.0"
set :repository,  "git://github.com/deiga/ilmo2.git"
set :branch, "master"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/timosand/cap"

set :gateway, "melkki.cs.helsinki.fi"

set :user, "timosand"
set :scm_username, "deiga"
set :use_sudo, false

role :web, "rails.cs.helsinki.fi"                          # Your HTTP server, Apache/etc
role :app, "rails.cs.helsinki.fi"                          # This may be the same as your `Web` server
role :db,  "rails.cs.helsinki.fi", :primary => true # This is where Rails migrations will run

namespace :deploy do
#   task :start {}
#   task :stop {}
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
  desc "Tell Mongrel to restart the app"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end