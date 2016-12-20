source 'https://rubygems.org'

gem 'active_model_serializers', '~> 0.10.0'
gem 'gtfs', git: "https://github.com/rpassis/gtfs", branch: "master"
gem 'postgresql'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

group :development, :test do
  gem 'byebug', platform: :mri
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "faker"
  gem 'rspec-rails'  
  gem "shoulda-matchers", require: false  
end

group :development do    
  gem 'guard'
  gem 'guard-rspec'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem "database_cleaner"
end