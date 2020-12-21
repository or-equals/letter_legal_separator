source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'bootsnap', require: false
gem 'combine_pdf'
gem 'mailgun-ruby'
gem 'pg'
gem 'pry-rails'
gem 'puma'
gem 'rails'
gem 'raygun4ruby'
gem 'rubyzip'
gem 'sass-rails'
gem 'sucker_punch'
gem 'turbolinks'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
end

group :development do
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'simplecov', require: false
end

group :production do
  gem 'scout_apm'
end
