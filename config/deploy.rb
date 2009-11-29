require 'config/capistrano_database'

# Copy settings
set :use_sudo, false
set :deploy_via, :copy
set :copy_strategy, :export
set :copy_compression, :gzip

# needs to be set when rake is not in standard location
set :rake, "/opt/ruby-enterprise-1.8.7-2009.10/bin/rake"
set :rails_env,      "production"
set :migrate_env,    ""
set :migrate_target, :current

# tunnel connection via public gateway
# note: ssh-key need s
set :gateway, "melkki.cs.helsinki.fi"

# Server settings

set :application, "ilmo2"

set :repository,  "git://github.com/deiga/ilmo2.git"
set :branch, "master"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :deploy_to, "/home/timosand/cap"

set :user, "timosand"
set :scm_username, "deiga"

role :web, "rails.cs.helsinki.fi"                   # Your HTTP server, Apache/etc
role :app, "rails.cs.helsinki.fi", :primary => true # This may be the same as your `Web` server
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
  
  #desc "Run migrate with trace"
  #task :migrate do
  #  run "cd #{current_path}; #{rake} --trace RAILS_ENV=#{rails_env} db:migrate"
  #end
end

after "deploy:symlink", "deploy:migrate"

namespace :app do
  desc "Run sample data on production"
  task :sample do
    run "export RAILS_ENV=production ; cd #{current_path} ; #{rake} db:seed courses=13"
  end
end

namespace :logs do
  desc "Show last 100 lines from production log"
  task :prod do
    run "tail -n 100 #{current_path}/log/production.log"
  end
end