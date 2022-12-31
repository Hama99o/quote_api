source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem "rails", "~> 7.0.0"
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'

gem "sprockets-rails"
# gem 'turbolinks', '~> 5'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'
gem 'active_model_serializers'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false


group :development, :test do
  gem "pry-byebug", platforms: %i[ mri mingw x64_mingw ]
  gem "factory_bot_rails", ">= 4.10.0"
end

group :development do
  gem 'dotenv-rails', '>= 2.5.0'
  gem 'web-console', '>= 3.6.2'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring', '~> 4.1'

  gem "nyan-cat-formatter"
  gem 'rspec-rails', '>= 3.7.2'

  gem 'guard-rspec', require: false
  gem 'guard-livereload', '~> 2.5', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.2.1', '< 4.0'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rack_session_access', '>= 0.2.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
