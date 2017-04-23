# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Get data needed to choose a banner for a given project and language 
  #
  # Usage:
  #
  # ```ruby
  # api.centralnoticechoicedata(**options).perform # returns string with raw output
  # # or
  # api.centralnoticechoicedata(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.centralnoticechoicedata.project(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Centralnoticechoicedata < MediaWiktory::GetAction
    # The project to get banner choice data for.
    #
    # @param value [String]
    # @return [self]
    def project(value)
      merge(project: value.to_s)
    end
    # The language to get banner choice data for.
    #
    # @param value [String]
    # @return [self]
    def language(value)
      merge(language: value.to_s)
    end
  end
end