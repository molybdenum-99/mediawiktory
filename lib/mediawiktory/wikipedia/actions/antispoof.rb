# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Check a username against AntiSpoof's normalisation checks. 
    #
    # Usage:
    #
    # ```ruby
    # api.antispoof.username(value).perform # returns string with raw output
    # # or
    # api.antispoof.username(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Antispoof < MediaWiktory::Wikipedia::Actions::Get

      # The username to check against AntiSpoof.
      #
      # @param value [String]
      # @return [self]
      def username(value)
        merge(username: value.to_s)
      end
    end
  end
end
