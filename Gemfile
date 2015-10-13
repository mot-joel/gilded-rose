source 'https://rubygems.org'
gem 'guard' # file system watcher and runner
gem 'guard-rake' # guard plugin for rake

gem 'flog', group: :analysis # complexity metric

group :rspec, :test do
  gem 'rspec', '~> 3' # test framework
  gem 'rspec-given', '~> 3' # Given-When-Then for rspec
  gem 'guard-rspec' # guard plugin for rspec
end

group :minitest, :test do
  gem 'minitest' # tiny test framework
  gem 'purdytest' # colored minitest output
  gem 'guard-minitest' # guard plugin for minitest
end
