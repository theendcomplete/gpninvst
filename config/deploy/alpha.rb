set :application, 'invest-api'
set :user, 'api_invest'
set :deploy_to, "/home/#{fetch(:user)}"
set :rails_env, 'alpha'

set :slack_url, 'https://discordapp.com/api/webhooks/601364080640655360/Md9iWILacEhLuRfRF4ikRKozlUMDbqTREVbIibvZjcGqJ7t5qlO1b5k71bT_WdMleRjM/slack'

append :linked_files, "config/credentials/#{fetch(:rails_env)}.key"

set :puma_threads, [4, 16]
set :puma_workers, 0
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log, "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

server 'api.invest.alpha.trinitydigital.ru', port: 22, user: fetch(:user), roles: %i[web app db], primary: true

namespace :deploy do
  before :starting, :make_dirs
  after :finishing, :cleanup
end
