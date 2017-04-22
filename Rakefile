require 'bundler/setup'
require 'rubygems/tasks'
Gem::Tasks.new

namespace :development do
  desc 'Render current wikipedia API into lib/mediawiktory/wikipedia'
  task :wikipedia do
    require 'mediawiktory/generator'

    MediaWiktory::Generator.new('https://en.wikipedia.org/w/api.php')
      .generate(path: 'lib/mediawiktory/wikipedia', namespace: 'MediaWiktory::Wikipedia')
  end
end
