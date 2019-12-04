source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Ruby
ruby '2.6.5'

# Core
# Default
gem 'rails', '~> 5.2.3' #default

# Middleware
# Default
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
# Custom
#gem 'unicorn' => 最終的なデプロイ段階でWebサーバーをNginxに変更する

# View/Frontend
# Default
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# Custom
gem 'autoprefixer-rails'
gem 'jquery-rails'
gem 'slim-rails'
gem 'html2slim'
#gem 'font-awesome-rails'
#gem 'mecab'
source 'https://rubygems.org'
gem 'natto'

# API
# Custom
gem 'aws-sdk-s3'
gem 'google-cloud-vision'
gem 'google-cloud-translate'
gem 'twitter'

# Oauth
# Custom
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'

# Debug
# Custom
gem 'pry-rails'
gem 'better_errors'
gem 'binding_of_caller'

# Backend
# Default
gem 'jbuilder', '~> 2.5'
# JavaScriptが発火しない場合、turbolinksを切る
gem 'turbolinks', '~> 5'
#gem 'redis', '~> 4.0'
gem 'bcrypt', '~> 3.1.7'
#gem 'mini_magick', '~> 4.8'
#gem 'capistrano-rails', group: :development
gem 'bootsnap', '>= 1.1.0', require: false
# Custom
gem 'rails-i18n'
gem 'faker'

group :development, :test do
  # Default
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Custom
  # RSpec
  gem 'factory_bot_rails'
  gem 'spring-commands-rspec'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Default
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
  # Custom
  # RSpec
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
