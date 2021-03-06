require './lib/mediawiktory/version'

Gem::Specification.new do |s|
  s.name     = 'mediawiktory'
  s.version  = MediaWiktory::VERSION
  s.authors  = ['Victor Shepelev']
  s.email    = 'zverok.offline@gmail.com'
  s.homepage = 'https://github.com/molybdenum-99/mediawiktory'

  s.summary = 'Full-featured MediaWiki client with Arel-like queries'
  s.licenses = ['MIT']

  s.required_ruby_version = '>= 2.1.0'

  s.files = `git ls-files`.split($RS).reject do |file|
    file =~ /^(?:
    spec\/.*
    |Gemfile
    |Rakefile
    |\.rspec
    |\.gitignore
    |\.rubocop.yml
    |\.travis.yml
    )$/x
  end
  s.require_paths = ["lib"]

  s.bindir = 'bin'
  s.executables << 'mediawiktory-gen'

  s.add_dependency 'nokogiri'
  s.add_dependency 'naught'
  s.add_dependency 'faraday'
  s.add_dependency 'faraday_middleware'
  s.add_dependency 'hashie'
  s.add_dependency 'addressable'
end
