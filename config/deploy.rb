`ssh-add`

# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "resume"
set :repo_url, "git@github.com:weilihmen/myresume.git"

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/myresume"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, '.bundle', "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :passenger_restart_with_touch, true

set :bundle_roles, :all                                         # this is default
set :bundle_servers, -> { release_roles(fetch(:bundle_roles)) } # this is default
set :bundle_binstubs, -> { shared_path.join('bin') }            # default: nil
set :bundle_gemfile, -> { release_path.join('MyGemfile') }      # default: nil
set :bundle_path, -> { shared_path.join('bundle') }             # this is default. set it to nil for skipping the --path flag.
set :bundle_without, %w{development test}.join(' ')             # this is default
set :bundle_flags, '--deployment --quiet'                       # this is default
set :bundle_env_variables, {}                                   # this is default
set :bundle_clean_options, ""                                   # this is default. Use "--dry-run" if you just want to know what gems would be deleted, without actually deleting them
set :bundle_jobs, 4 # default: nil, only available for Bundler >= 1.4
set :bundle_binstubs, -> { shared_path.join('bin') }
