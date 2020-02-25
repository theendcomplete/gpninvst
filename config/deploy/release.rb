set :application, 'invest-api'
set :user, 'api_invest'
set :branch, 'release'
set :deploy_to, "/home/#{fetch(:user)}"
set :rails_env, 'release'

set :slack_url, 'https://discordapp.com/api/webhooks/613674129144545330/IFStVI34dEjWNLamrU-lbLh4scjf3UtUSqSX8TrzKIDC6jfNDQTmeBEM6KzJNfcjr7zf/slack'

append :linked_files, "config/credentials/#{fetch(:rails_env)}.key"

set :puma_threads, [10, 1_000]
set :puma_workers, 0
set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log, "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

server 'api.invest.release.trinitydigital.ru', port: 22, user: fetch(:user), roles: %i[web app db], primary: true

namespace :deploy do
  before :starting, :make_dirs
  after :finishing, :cleanup
end
