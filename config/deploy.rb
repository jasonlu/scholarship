require 'capistrano/ext/multistage'

set :user, "deploy"  # The server's user for deploys
set :application, "Scholarship"
set :repository,  "git@github.com:jasonlu/scholarship.git"
set :keep_release, 5
set :use_sudo, false

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
set :scm_passphrases, ""
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :stages, ["staging", "production"]
set :default_stage, "staging"

#load 'deploy/assets'
namespace :deploy do
  
end


namespace :bundle do

  desc "run bundle install and ensure all gem requirements are met"
  task :install do
    run "cd #{current_path} && bundle install  --without=test"
  end

end

# Generate an additional task to fire up the thin clusters
namespace :deploy do

  desc "Stop the Thin processes"
  task :stop do
    run "cd #{current_path} && bundle exec thin stop -d"
  end

  desc "Start the Thin processes"
  task :start do
    run "cd #{current_path} && bundle exec thin start -d"
  end

  namespace :assets do
    desc 'Run the precompile task locally and rsync with shared'
    task :precompile, :roles => :web, :except => { :no_release => true } do
#      %x{bundle exec rake assets:clean}
#      %x{bundle exec rake assets:precompile}
      %x{rsync --recursive --times --rsh=ssh --compress --human-readable --progress public/assets #{user}@#{web}:#{shared_path}}
      %x{bundle exec rake assets:clean}
    end
  end

end

before "deploy:restart", "deploy:assets:precompile", "deploy:stop", "deploy:start"
#before "deploy:restart", "bundle:install"







# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end