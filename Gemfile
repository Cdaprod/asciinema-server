source 'https://rubygems.org'

# Web framework and related gems
gem 'sinatra', '~> 3.0'
gem 'puma', '~> 6.0'
gem 'rack', '~> 2.2' # Use Rack 2.x since Sinatra 3.x does not yet support Rack 3.x
gem 'rake', '~> 13.0'

# SQLite database support
gem 'sqlite3', '~> 1.5'

# ActiveRecord for ORM and database management
gem 'activerecord', '~> 7.0'

# Redis for caching (optional)
gem 'redis', '~> 5.0'

# Authentication and security
gem 'rack-protection', '~> 3.0'
gem 'bcrypt', '~> 3.1'

# Asset management
gem 'sassc', '~> 2.4'
gem 'sprockets', '~> 4.0'

# File uploads and session management
gem 'carrierwave', '~> 2.0'

# Session management - lock rack-session to a compatible version with rack 2.x
gem 'rack-session', '~> 1.0' # Downgrade to version 1.x which is compatible with Rack 2.x

# Debugging and logging
gem 'logger', '~> 1.4'
gem 'uglifier', '~> 4.0'

# Development and testing group
group :development, :test do
  gem 'rspec', '~> 3.10'
  gem 'capybara', '~> 3.35'
end