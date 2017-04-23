# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Returns all pages transcluded on the given pages. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.templates(**options).perform # returns string with raw output
  # # or
  # api.some_action.templates(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.templates.namespace(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Templates

    # Show templates in this namespaces only.
    #
    # @param values [Array<String>] Allowed values: "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(*values)
      merge(tlnamespace: values.join('|'))
    end

    # How many templates to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(tllimit: value.to_s)
    end

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(tlcontinue: value.to_s)
    end

    # Only list these templates. Useful for checking whether a certain page uses a certain template.
    #
    # @param values [Array<String>]
    # @return [self]
    def templates(*values)
      merge(tltemplates: values.join('|'))
    end

    # The direction in which to list.
    #
    # @param value [String] One of "ascending", "descending".
    # @return [self]
    def dir(value)
      merge(tldir: value.to_s)
    end
  end
end
