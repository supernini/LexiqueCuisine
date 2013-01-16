set :rvm_ruby_string, '1.9.3'
require "bundler/capistrano"
require "rvm/capistrano"
set :rvm_type, :system
set :application, "LexiqueCuisine"
set :repository,  "git@bitbucket.org:supernini/lexiquecuisine.git"
set :scm, :git
set :user, :root
ssh_options[:forward_agent] = true
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, '/home/httpd/vhosts/LexiqueCuisine'
default_run_options[:pty] = true

role :web, "lasagne"                          # Your HTTP server, Apache/etc
role :app, "lasagne"                          # This may be the same as your `Web` server
role :db,  "lasagne", :primary => true # This is where Rails migrations will run
                                            #load 'deploy/assets'
task :search_libs, :roles => :web do
  run "ls"
end

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end

namespace :deploy do

  desc "Restart Thin"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "cd #{deploy_to}/current && bundle exec thin restart -C #{deploy_to}/current/config/thin.yml"
  end
end
