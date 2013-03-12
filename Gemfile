source "https://rubygems.org"

gemspec

require "#{File.expand_path("..", __FILE__)}/lib/development.rb"

gem "tvd-tvdinner" unless File.exists?(File.expand_path("../tvd-tvdinner.gemspec", __FILE__))
gem "chefspec"
gem "minitest-chef-handler"
gem "foodcritic", :platforms => :ruby_19
