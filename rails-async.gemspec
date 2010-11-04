# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'async/version'

Gem::Specification.new do |s|
  s.name                      = %q{rails-async}
  s.version                   = Async::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors                   = ["Adam Bachman"]
  s.date                      = %q{2010-11-04}
  s.summary                   = %q{Simple asynchronously loaded blocks in your Rails 3 views.}
  s.description               = %q{The Rails Async engine lets your controllers respond instantly.}
  s.email                     = %q{adam.bachman@gmail.com}
  s.homepage                  = %q{http://github.com/abachman/rails-async}
  s.require_paths             = ["lib"]
  s.rubygems_version          = %q{1.3.7}

  s.files                     = Dir.glob("{bin,lib,app}/**/*") + %w(LICENSE README.md ROADMAP.md CHANGELOG.md)
  s.files = [
    'CHANGELOG.md',
    'init.rb',
    'LICENSE',
    'README.md',
    'ROADMAP.md',
    'Rakefile',
    'app/controllers/async_controller.rb',
    'app/helpers/async_helper.rb',
    'app/models/async_cache.rb',
    'config/routes.rb',
    'lib/async/engine.rb',
    'lib/async/version.rb',
    'lib/async.rb',
    'rails-async.gemspec'
  ]

  # require 'find'
  # Find.find('test/rails_root') do |f|
  #   if (/\.bundle/ !~ f &&
  #       /tmp/ !~ f &&
  #       /log/ !~ f &&
  #       /seeds\.rb/ !~ f &&
  #       /\.sqlite/ !~ f &&
  #       /\.git/ !~ f &&
  #       !File.directory?(f))
  #     puts "    '#{f}',"
  #   end
  # end

  s.test_files = [
    'test/helper.rb',
    'test/test_async_cache.rb',
    'test/rails_root/Gemfile',
    'test/rails_root/README',
    'test/rails_root/Rakefile',
    'test/rails_root/app/controllers/application_controller.rb',
    'test/rails_root/app/controllers/start_controller.rb',
    'test/rails_root/app/helpers/application_helper.rb',
    'test/rails_root/app/helpers/start_helper.rb',
    'test/rails_root/app/views/layouts/application.html.erb',
    'test/rails_root/app/views/start/_account.html.erb',
    'test/rails_root/app/views/start/fast.html.erb',
    'test/rails_root/app/views/start/fast_multi.html.erb',
    'test/rails_root/app/views/start/index.html.erb',
    'test/rails_root/app/views/start/slow.html.erb',
    'test/rails_root/config.ru',
    'test/rails_root/config/application.rb',
    'test/rails_root/config/boot.rb',
    'test/rails_root/config/database.yml',
    'test/rails_root/config/environment.rb',
    'test/rails_root/config/environments/development.rb',
    'test/rails_root/config/environments/production.rb',
    'test/rails_root/config/environments/test.rb',
    'test/rails_root/config/initializers/backtrace_silencers.rb',
    'test/rails_root/config/initializers/inflections.rb',
    'test/rails_root/config/initializers/mime_types.rb',
    'test/rails_root/config/initializers/secret_token.rb',
    'test/rails_root/config/initializers/session_store.rb',
    'test/rails_root/config/locales/en.yml',
    'test/rails_root/config/routes.rb',
    'test/rails_root/db/schema.rb',
    'test/rails_root/doc/README_FOR_APP',
    'test/rails_root/public/404.html',
    'test/rails_root/public/422.html',
    'test/rails_root/public/500.html',
    'test/rails_root/public/favicon.ico',
    'test/rails_root/public/images/rails.png',
    'test/rails_root/public/images/spinner.gif',
    'test/rails_root/public/javascripts/jquery.js',
    'test/rails_root/public/javascripts/rails.js',
    'test/rails_root/public/robots.txt',
    'test/rails_root/script/rails',
    'test/rails_root/test/functional/start_controller_test.rb',
    'test/rails_root/test/performance/browsing_test.rb',
    'test/rails_root/test/test_helper.rb',
    'test/rails_root/test/unit/helpers/start_helper_test.rb',
  ]
end

