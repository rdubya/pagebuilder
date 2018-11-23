
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pagebuilder/version"

Gem::Specification.new do |spec|
  spec.name          = 'pagebuilder'
  spec.version       = PageBuilder::VERSION
  spec.authors       = ['Rob Widmer']
  spec.email         = ['rdwidmer@gmail.com']

  spec.summary       = %q{PageBuilder provides helpers for building html5 pages with Nokogiri}
  spec.description   = %q{PageBuilder is a utility library to make building html5 pages easier. It has two parts. The first is some classes that provide an interface for dealing with common html element attributes. The second is a module, that can be mixed into your presenters, that provides helpers for generating html nodes with less code than using Nokogiri directly. }
  spec.homepage      = 'https://github.com/rdubya/pagebuilder'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.0'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']

  spec.metadata['yard.run'] = 'yri' # use "yard" to build full HTML docs

  spec.add_dependency 'nokogiri', '>= 1.8.0'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'faker', '> 1.8'
  spec.add_development_dependency 'rake', '> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'yard', '~> 0.9.3'
end
