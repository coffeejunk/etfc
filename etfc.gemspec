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
  spec.description   = 'ETFC is a tool to create collages from flickr images based upon user provided keywords.'
  spec.homepage      = 'https://www.github.com/coffeejunk/etfc'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.46.0'
end
