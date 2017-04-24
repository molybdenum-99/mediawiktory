# frozen_string_literal: true

module MediaWiktory
  # Default wrapper for lates MediaWiki API available of English Wikipedia; generated by MediaWiki.
  #
  # Most of the time .....
  module Wikipedia
  end

  Dir[File.expand_path('../wikipedia/{,**/}*.rb', __FILE__)].each { |f| require f }
end
