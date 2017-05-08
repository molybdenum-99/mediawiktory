# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Fetch templates that are used within the PageTriage application. 
    #
    # Usage:
    #
    # ```ruby
    # api.pagetriagetemplate(**options).perform
    # # or
    #
    # api.pagetriagetemplate.view(value).perform # returns string with raw output
    # # or
    # api.pagetriagetemplate.view(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Pagetriagetemplate < MediaWiktory::Wikipedia::Actions::Get

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
end
