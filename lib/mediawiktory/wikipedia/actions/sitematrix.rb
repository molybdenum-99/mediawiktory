# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Get Wikimedia sites list. 
    #
    # Usage:
    #
    # ```ruby
    # api.sitematrix(**options).perform # returns string with raw output
    # # or
    # api.sitematrix(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.sitematrix.type(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Sitematrix < MediaWiktory::Wikipedia::Actions::Get

      # Filter the Site Matrix by type:
      #
      # @param values [Array<String>] Allowed values: "special" (One off and multilingual Wikimedia projects), "language" (Wikimedia projects under this language code).
      # @return [self]
      def type(*values)
        values.inject(self) { |res, val| res.type_single(val) }
      end

      # @private
      def type_single(value)
        defined?(super) && super || ["special", "language"].include?(value.to_s) && merge(smtype: value.to_s)
      end

      # Filter the Site Matrix by wiki state:
      #
      # @param values [Array<String>] Allowed values: "all", "closed", "private", "fishbowl", "nonglobal".
      # @return [self]
      def state(*values)
        values.inject(self) { |res, val| res.state_single(val) }
      end

      # @private
      def state_single(value)
        defined?(super) && super || ["all", "closed", "private", "fishbowl", "nonglobal"].include?(value.to_s) && merge(smstate: value.to_s)
      end

      # Which information about a language to return.
      #
      # @param values [Array<String>] Allowed values: "code", "name", "site", "localname".
      # @return [self]
      def langprop(*values)
        values.inject(self) { |res, val| res.langprop_single(val) }
      end

      # @private
      def langprop_single(value)
        defined?(super) && super || ["code", "name", "site", "localname"].include?(value.to_s) && merge(smlangprop: value.to_s)
      end

      # Which information about a site to return.
      #
      # @param values [Array<String>] Allowed values: "url", "dbname", "code", "sitename".
      # @return [self]
      def siteprop(*values)
        values.inject(self) { |res, val| res.siteprop_single(val) }
      end

      # @private
      def siteprop_single(value)
        defined?(super) && super || ["url", "dbname", "code", "sitename"].include?(value.to_s) && merge(smsiteprop: value.to_s)
      end

      # Maximum number of results.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(smlimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(smcontinue: value.to_s)
      end
    end
  end
end
