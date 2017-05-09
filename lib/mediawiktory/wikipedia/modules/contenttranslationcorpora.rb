# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get the section-aligned parallel text for a given translation. See also list=cxpublishedtranslations. Dumps are provided in different formats for high volume access.
    #
    # The "submodule" (MediaWiki API term) is included in action after setting some param, providing
    # additional tweaking for this param. Example (for {MediaWiktory::Wikipedia::Actions::Query} and
    # its submodules):
    #
    # ```ruby
    # api.query             # returns Actions::Query
    #    .prop(:revisions)  # adds prop=revisions to action URL, and includes Modules::Revisions into action
    #    .limit(10)         # method of Modules::Revisions, adds rvlimit=10 to URL
    # ```
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Contenttranslationcorpora

      # ID of the translation.
      #
      # @param value [Integer]
      # @return [self]
      def translationid(value)
        merge(translationid: value.to_s)
      end

      # Whether to strip all HTML tags to return plaintext.
      #
      # @return [self]
      def striphtml()
        merge(striphtml: 'true')
      end

      # By default you will get all three of following if available: source text, machine translation and the postedited translation by the user. This parameter allows you not return some of these types.
      #
      # @param values [Array<String>] Allowed values: "source", "mt", "user".
      # @return [self]
      def types(*values)
        values.inject(self) { |res, val| res._types(val) or fail ArgumentError, "Unknown value for types: #{val}" }
      end

      # @private
      def _types(value)
        defined?(super) && super || ["source", "mt", "user"].include?(value.to_s) && merge(types: value.to_s, replace: false)
      end
    end
  end
end
