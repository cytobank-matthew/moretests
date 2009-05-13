set :user, "mgood"



set :application, "capistrano.test"

puts "may need to fully qualify the URL here"
set :deploy_to, "/Users/mgood/Sites/captest"


##### Source Code Management ######3
puts "scm_username *may* cause an issue, but doubtful.  If needed, just put username into some other variable name, and dynamically load into the repo info."
set :scm, :git
set :scm_username, "cytobank-matthew"
set :repository,  "git@github-cytobank:#{scm_username}/moretests.git"


#### Deployment Server Info ####
# setting :paranoid = false will prevent a server host fingerprint check.
ssh_options[:paranoid] = false

set :use_sudo, 'false'

set :user, "mgood"
set :domain, "192.168.1.107"

role :app, "192.168.1.107"
role :web, "192.168.1.107"
role :db, "192.168.1.107", :primary => true

=begin
puts "note that the db connection will likely not work = I believe its configured to only be accessible locally"
server "#{domain}/~#{user}", :app, :web, :db, :primary => true

#role :app, :domain
#role :web, :domain
#role :db,  localhost"your db-server here", :primary => true

=end