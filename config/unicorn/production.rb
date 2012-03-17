# Set your full path to application.
app_path = "/srv/satq/current"

# Set unicorn options
worker_processes 4
timeout 180
listen "127.0.0.1:8080"


# Fill path to your app
working_directory app_path

# Should be 'production' by default, otherwise use other env 
rails_env = ENV['RAILS_ENV'] || 'production'

# Log everything to one file
stderr_path "log/unicorn.log"
stdout_path "log/unicorn.log"

# Set master PID location
pid "#{app_path}/tmp/pids/unicorn.pid"
