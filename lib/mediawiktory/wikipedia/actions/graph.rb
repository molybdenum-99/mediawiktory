# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Access graph tag functionality. 
  #
  # Usage:
  #
  # ```ruby
  # api.graph(**options).perform # returns string with raw output
  # # or
  # api.graph(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.graph.hash(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Graph < MediaWiktory::GetAction

    # Hash value of the graph
    #
    # @param value [String]
    # @return [self]
    def hash(value)
      merge(hash: value.to_s)
    end

    # Title of the article with the graph
    #
    # @param value [String]
    # @return [self]
    def title(value)
      merge(title: value.to_s)
    end

    # Text of the graph to be converted to JSON. Must be posted and used without title and hash parameters
    #
    # @param value [String]
    # @return [self]
    def text(value)
      merge(text: value.to_s)
    end
  end
end
