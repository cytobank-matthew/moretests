set :user, "mgood"

set :application, "capistrano.test"

#set :deploy_to, "/Users/mgood/Sites/captest"

##### Source Code Management ######3
set :scm, :git
set :scm_command, "/usr/local/git/bin/git"

#set :scm_username, "cytobank-matthew"
#set :repository,  "git@github-cytobank:#{scm_username}/moretests.git"
set :repository, "git@github.com:cytobank-matthew/moretests.git"

#set :copy_strategy, :export

#### Deployment Server Info ####
# setting :paranoid = false will prevent a server host fingerprint check.
ssh_options[:paranoid] = false

#set :use_sudo, 'false'

set :user, "mgood"
set :domain, "cytomatt.local"

set :runner, user

set :deploy_to, "/Users/mgood/Sites/apps/coolness"

role :app, domain
role :web, domain
role :db, domain, :primary => true


desc "restart override"
task :restart, :roles => :app do
  run "killall -9 ruby"
end

=begin
puts "note that the db connection will likely not work = I believe its configured to only be accessible locally"
server "#{domain}/~#{user}", :app, :web, :db, :primary => true

#role :app, :domain
#role :web, :domain
#role :db,  localhost"your db-server here", :primary => true

=end