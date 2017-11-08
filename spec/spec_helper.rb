$:.unshift 'lib'
require 'mediawiktory'

require 'rspec/its'
require 'webmock/rspec'
require 'saharspec'

include Saharspec::Util

class String
  def unindent
    multiline(self)
  end
end

def read_fixture(path)
  File.read(File.join('spec/fixtures', path))
end
