require 'capistrano-db-tasks'
# config valid only for current version of Capistrano
lock '3.4.0'

application = 'activebridge'
user = 'deploy'

set :user, user
set :application, application
set :repo_url, 'git@github.com:activebridge/activebridge.git'

set :scm, :git
# set :default_env, { rvm_bin_path: '~/.rvm/bin' }
# set :rvm_type, :user
set :default_shell, '/bin/bash -l'
set :keep_releases, 5
set :branch, 'master'
set :pty, true
set :use_sudo, false
set :passenger_restart_with_sudo, true

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/#{user}/#{application}"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{ config/secrets.yml config/database.yml config/cloudinary.yml }

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :mkdir, '-p', "#{ release_path }/tmp"
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
end
