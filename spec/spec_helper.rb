$:.unshift 'lib'
require 'mediawiktory'

require 'rspec/its'
require 'webmock/rspec'
require 'faker'
require 'saharspec/its_map'

def read_fixture(path)
  File.read(File.join('spec/fixtures', path))
end
