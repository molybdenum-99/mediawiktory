# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Fetch templates that are used within the PageTriage application. 
  #
  # Usage:
  #
  # ```ruby
  # api.pagetriagetemplate(**options).perform # returns string with raw output
  # # or
  # api.pagetriagetemplate(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.pagetriagetemplate.view(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Pagetriagetemplate < MediaWiktory::GetAction

    # The PageTriage view for which you need the templates.
    #
    # @param value [String]
    # @return [self]
    def view(value)
      merge(view: value.to_s)
    end

    # The template to fetch. Separate multiple with the | character.
    #
    # @param value [String]
    # @return [self]
    def template(value)
      merge(template: value.to_s)
    end
  end
end
