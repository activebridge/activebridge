require 'capistrano-db-tasks'
# config valid only for current version of Capistrano
lock '3.7.1'

set :application, 'activebridge'
set :repo_url, 'git@github.com:activebridge/activebridge.git'

set :deploy_to, '/home/deploy/'

set :linked_files, fetch(:linked_files, []).push(
  'config/database.yml',
  'config/secrets.yml',
  # 'config/cloudinary.yml'
)

set :linked_dirs, fetch(:linked_dirs, []).push(
  'log',
  'tmp/pids',
  'tmp/cache',
  'tmp/sockets',
  'vendor/bundle',
  'public/system',
)
