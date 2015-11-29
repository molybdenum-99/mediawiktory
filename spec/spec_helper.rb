$:.unshift 'lib'
require 'mediawiktory'

require 'rspec/its'
require 'webmock/rspec'
require 'faker'

def read_fixture(path)
  File.read(File.join('spec/fixtures', path))
end
