source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'yaml_db', git: 'https://github.com/lostapathy/yaml_db.git'
gem 'rails_autolink'
gem 'auditable'

group :production do
  platforms :ruby do
    gem 'pg'
  end

  platforms :jruby do
    gem 'activerecord-jdbcpostgresql-adapter'
  end

  gem 'newrelic_rpm', '>= 3.5.3.25'
end

group :development do
  platforms :ruby do
    gem 'sqlite3'
  end

  platforms :jruby do
    gem 'jruby-openssl'
    gem 'activerecord-jdbcsqlite3-adapter'
  end
  gem 'pry-rails'
  gem 'awesome_print'
  gem 'simplecov', platform: :mri
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
gem 'jbuilder'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem 'devise'
gem 'devise_invitable'
