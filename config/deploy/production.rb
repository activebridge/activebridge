location = '104.131.66.248'

role :app, location
role :web, location
role :db,  location

server location, user: 'deploy', roles: %w(web app db), prymary: :true

set :ssh_options, user: 'deploy', port: 5030
