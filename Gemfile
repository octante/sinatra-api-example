source 'https://rubygems.org'

ruby '2.3.1'

# Webserver
gem 'puma'

# Application auto-reloader
gem 'shotgun', '0.9.1'

# Sinatra framework
gem 'rack'
gem 'rake'
gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib'

# Passwords encrypt library
gem 'bcrypt', '~> 3.1'

# MongoDB ORM
gem 'mongo_mapper', '~> 0.13'
gem 'bson_ext', '~> 1.12'

gem 'multi_json'

group :development, :test do
  gem 'guard'
  gem 'guard-minitest'
end

group :test do
  gem 'minitest', '~> 5.4.1'
  gem 'minitest-rg'
  gem 'rack-test', '~> 0.6.2'
  gem 'mocha', '~> 1.1.0', require: false
end