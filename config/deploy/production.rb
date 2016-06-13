location = 'active-bridge.com'

role :app, location
role :web, location
role :db,  location

server location, user: 'deploy', roles: %w{web app db}, prymary: :true

set :ssh_options, { user: 'deploy', port: 5030 }
