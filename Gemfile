source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'
gem "unicorn-rails"
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'spring'

group :development, :production do  
  gem 'rails_12factor'  
  gem 'therubyracer'    
  gem 'pg'
end

group :test do
  gem 'web-console', '~> 2.0'
  gem 'pry'
end

gem 'redis'
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'
gem "omniauth-google-oauth2"
gem "omniauth-github"
gem 'cancancan'
gem 'haml'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'gupshup'
gem 'kaminari'
# gem 'mailcatcher'
gem "friendly_id"
gem "meta-tags"

gem "bootstrap-wysihtml5-rails"

#------- Elastic Search
gem 'elasticsearch-model'
gem 'elasticsearch-rails'
gem 'elasticsearch-persistence'

#------ Solar Search
gem 'sunspot_rails'
gem 'sunspot_solr' # optional pre-packaged Solr distribution for use in development
gem "progress_bar"

#------ Uploader
gem 'carrierwave'
gem 'cloudinary'
gem 'mini_magick'

#------ Delayed Jobs
gem "delayed_job_active_record"
gem "sidekiq"
gem "sidekiq-client-cli"
gem 'daemons'

#------ Excel Creator / Pdf generator
gem 'spreadsheet'
gem "prawn"

#------ Payment APIs
gem "activemerchant"  #ActiveMerchant expects amounts to be Integer values in cents

#------- country / state dropdown data
gem 'carmen-rails'

#-------- App Credential Configuration ---------------#
gem "app_config"

# ------- how to setup unicorn ---------- #
# https://railskey.wordpress.com/2013/11/25/setting-up-unicorn-with-nginx-on-ruby-on-rails/
# gem 'unicorn'
# gem "unicorn-rails"
# rails server unicorn  #to run the application under unicorn server

gem 'acts-as-taggable-on'

# AngularJS based gems

gem 'angular_rails_csrf'

source "https://rails-assets.org" do
  gem "rails-assets-angular-devise"
end