source 'https://rubygems.org'

gem 'rake'
gem 'hanami',       '~> 1.2'
gem 'hanami-model', '~> 1.2'

gem 'sqlite3'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun', platforms: :ruby
  gem 'hanami-webconsole'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'pry-byebug'
end

group :test do
  gem 'minitest'
  gem 'capybara'
  gem 'minitest-reporters'
end

group :production do
  # gem 'puma'
end
