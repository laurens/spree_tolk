# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_tolk'
  s.version     = '1.5.0'
  s.summary     = 'Spree 1.2 extension providing a web interface for managing i18n yaml files'
  s.description = 'spree_tolk Spree extension providing web interface for managing i18n yaml files. It is based on a fork of the tolk project'
  s.required_ruby_version = '>= 1.9'

  s.author    = 'Laurens Nienhaus'
  s.email     = 'l.nienhaus@gmail.com'
  s.homepage  = 'http://github.com/laurens/spree_tolk'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 1.2.0'
  s.add_dependency('ya2yaml', '~> 0.26')

  s.add_development_dependency 'capybara', '1.0.1'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'laundry'
end
