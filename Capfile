require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

# require 'capistrano/rvm'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'

# require 'capistrano/sidekiq'
# require 'capistrano/sidekiq/monit'

require 'capistrano/puma'
install_plugin Capistrano::Puma

require 'whenever/capistrano'

require 'capistrano/slackify'

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }