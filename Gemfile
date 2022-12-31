source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem "rails", "~> 7.0.0"
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.12'

gem "sprockets-rails"

gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
# gem 'turbolinks', '~> 5'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'active_model_serializers'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'rspec-collection_matchers'
  gem "factory_bot_rails"
  gem "shoulda-matchers", require: false
  gem 'faker'
  gem 'rspec-retry'
  gem 'database_cleaner'
  gem 'rails-controller-testing'
  gem "pry-byebug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem 'rubocop', require: false
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'guard-rspec', require: false
  gem 'guard-livereload', '~> 2.5', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
