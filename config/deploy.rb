set :application, "RAA"
set :repository,  "git@github.com:GeoSRL/raa.git"

set :scm, :git
set :user, "dan"
set :domain, "dgc.io"
set :use_sudo, false
role :app, domain
role :web, domain
role :db, domain, :primary => true

set :deploy_via, :copy
set :deploy_to, "/raa"
set :keep_releases, 3

after "deploy:restart", "deploy:cleanup" 

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "touch /tmp/restart.txt"
     run "cp /extra/raa/database.yml /raa/current/config/"
     run "cp /extra/raa/unicorn.rb /raa/current/config/"
     run "cp /extra/raa/secret_token.rb /raa/current/config/initializers/" 
  end
 end
