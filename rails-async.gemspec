# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'bundler'
require 'async/version'

Gem::Specification.new do |s|
  s.add_bundler_dependencies

  s.name                      = %q{rails-async}
  s.version                   = Async::VERSION
  s.rubyforge_project         = "rails-async"
  s.required_rubygems_version = ">= 1.3.6"
  s.authors                   = ["Adam Bachman"]
  s.date                      = %q{2010-11-04}
  s.summary                   = %q{Simple asynchronously loaded blocks in your Rails 3 views.}
  s.description               = %q{The Rails Async engine lets your controllers respond instantly.}
  s.email                     = %q{adam.bachman@gmail.com}
  s.files                     = Dir.glob("{bin,lib,app}/**/*") + %w(LICENSE README.md ROADMAP.md CHANGELOG.md)
  s.homepage                  = %q{http://github.com/abachman/rails-async}
  s.require_path              = "lib"
  s.rubygems_version          = %q{1.3.7}
end

