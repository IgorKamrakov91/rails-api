source 'https://rubygems.org'


gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'sqlite3'
gem 'puma', '~> 3.0'
gem 'kaminari'
gem 'active_model_serializers', github: "rails-api/active_model_serializers"

group :test do
  gem 'minitest-utils', require: 'minitest/utils'
  gem 'rack-test', require: 'rack/test'
  gem 'pry'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'hirb', '~> 0.7.3'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
