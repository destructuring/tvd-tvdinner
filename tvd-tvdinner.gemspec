# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "tvd-tvdinner/version"

Gem::Specification.new do |s|
  s.name        = "tvd-tvdinner"
  s.version     = ENV['EDIT_tvdinner'] ? "#{TVDinner::TVDinner::VERSION}.rc#{%x(git log --max-count=1 --pretty=format:%ct)}" : TVDinner::TVDinner::VERSION
  s.homepage    = "http://destructuring.org/tvd-tvdinner"
  s.license     = "Apache 2.0"
  s.author      = "Tom Bombadil"
  s.email       = "amanibhavam@destructuring.org"
  s.summary     = "Generates a tvdinner project"
  s.description = "Generates a tvdinner project"

  s.executables  = []
  s.test_files   = `git ls-files -- {spec,tasks}/*`.split("\n")
  s.files        = `git ls-files -- lib/* cookbooks/*`.split("\n") 

  s.files       += s.test_files
  s.files       += s.executables.map {|f| File.join("bin", f) }
  s.files       +=  %w(LICENSE NOTICE VERSION README.md)

  s.require_path = "lib"

  s.add_dependency "chef"
end
