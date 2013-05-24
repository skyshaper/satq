##!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Satq::Application.load_tasks

namespace :user do
  task :invite, [:email] => :environment do |t, args|
    User.invite! email: args[:email]
  end
end