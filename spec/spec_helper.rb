$:.unshift 'lib'
require 'mediawiktory'

require 'rspec/its'
require 'webmock/rspec'
require 'saharspec/its_map'
require 'saharspec/its_call'
require 'saharspec/send_message'
require 'saharspec/string_ext'

def read_fixture(path)
  File.read(File.join('spec/fixtures', path))
end
