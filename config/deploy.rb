# config valid for current version and patch releases of Capistrano
lock "~> 3.17.0"

set :default_stage, "production"
set :application, "scotta38_aws"
set :repo_url, "git@github.com:ScottA38/ScottA38.github.io.git"
set :branch, 'AWS-Migration'

# the name of the user that should be used for deployments on your VPS
set :user, "deploy"
role :web, 'aws-server'

# Default branch is :master
#ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# the path to deploy to on your VPS
set :deploy_to, "/var/www/html/#{fetch(:application)}"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
set :pty, true

# Default value for :linked_files is []
append :linked_files, "_config.jeql.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 3

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
set :ssh_options, {:forward_agent => true}

# Tasks for deploying Jekyll
namespace :deploy do
  desc 'Copy untracked (secret) files to remote'
  task :copy_secrets do
    on roles(:web) do
      within "#{fetch(:deploy_to)}/current" do
        # Copy across config file
        :linked_files.each do |f|
          upload! f , "#{fetch(:deploy_to)}/current" + f
        end
      end
    end
  end
  desc 'Build the website on the remote server using Jekyll'
  task :jekyll_build do
    on roles(:web) do
      within "#{fetch(:deploy_to)}/current" do
        execute :bundle, :exec, :jekyll, 'build', '--config', '_config.yml,_config.jeql.yml'
        execute "rm -f _site/Capfile"
        execute "rm -rf _site/config"
      end
    end
  end
  task :bundle_update do
	on roles(:web) do
		within "#{fetch(:deploy_to)}/current" do
		  if defined? Bundler
        execute :bundle, 'update'
        else
        error = CommandError.new("ruby-bundler not found on remote server - exiting")
        end
      end
	  end
  end
end

before "deploy:jekyll_build", "deploy:bundle_update"
after "deploy:symlink:release", "deploy:jekyll_build"

append :linked_dirs, '.bundle', '.jekyll-cache'