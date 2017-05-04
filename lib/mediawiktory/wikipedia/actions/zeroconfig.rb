# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Get configuration of the Zero extension. 
    #
    # Usage:
    #

    # ```ruby
    # api.zeroconfig(**options).perform # returns string with raw output
    # # or
    # api.zeroconfig(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.zeroconfig.type(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Zeroconfig < MediaWiktory::Wikipedia::Actions::Get

      # What kind of Zero info is needed:
      #
      # @param value [String] One of "config" (Get a trimmed-down carrier configuration based on the X-CS header), "message" (Get language-appropriate verbiage based on X-CS header; requires agent param).
      # @return [self]
      def type(value)
        defined?(super) && super || ["config", "message"].include?(value.to_s) && merge(type: value.to_s)
      end

      # When setting type to message, include a source agent value as well.
      #
      # @param value [String]
      # @return [self]
      def agent(value)
        merge(agent: value.to_s)
      end
    end
  end
end
