# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Show events that were caught by one of the abuse filters. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.abuselog(**options).perform # returns string with raw output
    # # or
    # api.some_action.abuselog(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.abuselog.start(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Abuselog

    # The timestamp to start enumerating from.
    #
    # @param value [Time]
    # @return [self]
    def start(value)
      merge(aflstart: value.iso8601)
    end

    # The timestamp to stop enumerating at.
    #
    # @param value [Time]
    # @return [self]
    def end(value)
      merge(aflend: value.iso8601)
    end

    # In which direction to enumerate:
    #
    # @param value [String] One of "newer" (List oldest first. Note: aflstart has to be before aflend), "older" (List newest first (default). Note: aflstart has to be later than aflend).
    # @return [self]
    def dir(value)
      merge(afldir: value.to_s)
    end

    # Show only entries done by a given user or IP address.
    #
    # @param value [String]
    # @return [self]
    def user(value)
      merge(afluser: value.to_s)
    end

    # Show only entries occurring on a given page.
    #
    # @param value [String]
    # @return [self]
    def title(value)
      merge(afltitle: value.to_s)
    end

    # Show only entries that were caught by a given filter ID.
    #
    # @param values [Array<String>]
    # @return [self]
    def filter(*values)
      merge(aflfilter: values.join('|'))
    end

    # The maximum amount of entries to list.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(afllimit: value.to_s)
    end

    # Which properties to get.
    #
    # @param values [Array<String>] Allowed values: "ids", "filter", "user", "ip", "title", "action", "details", "result", "timestamp", "hidden", "revid".
    # @return [self]
    def prop(*values)
      merge(aflprop: values.join('|'))
    end
  end
  end
end
