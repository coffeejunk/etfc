# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'etfc/version'

Gem::Specification.new do |spec|
  spec.name          = 'etfc'
  spec.version       = ETFC::VERSION
  spec.authors       = ['Maximilian Haack']
  spec.email         = ['mxhaack@gmail.com']

  spec.summary       = 'A flickr collage maker'
  spec.description   = 'ETFC is a tool to create collages from flickr ' \
                       'images based upon user provided keywords.'
  spec.homepage      = 'https://www.github.com/coffeejunk/etfc'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'flickraw', '~> 0.9.9'
  spec.add_runtime_dependency 'rmagick', '~> 4.1.0.rc2'
  spec.add_runtime_dependency 'thor', '~> 0.19.4'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.46.0'
  spec.add_development_dependency 'simplecov', '~> 0.12.0'
  spec.add_development_dependency 'webmock', '~> 2.3.1'
  spec.add_development_dependency 'vcr', '~> 3.0.3'
end
