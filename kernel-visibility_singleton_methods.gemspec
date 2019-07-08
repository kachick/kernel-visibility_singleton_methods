Gem::Specification.new do |gem|
  gem.name          = 'kernel-visibility_singleton_methods'
  gem.version       = '0.0.1'
  gem.authors       = ['Kenichi Kamiya']
  gem.email         = ['kachick1+ruby@gmail.com']
  gem.summary       = ''
  gem.description   = gem.summary.dup
  gem.homepage      = 'http://github.com/kachick/kernel-visibility_singleton_methods'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'yard', '~> 0.8'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'bundler'
end
