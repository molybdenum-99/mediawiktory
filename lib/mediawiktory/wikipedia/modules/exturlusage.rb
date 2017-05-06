# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Enumerate pages that contain a given URL. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Exturlusage

      # Which pieces of information to include:
      #
      # @param values [Array<String>] Allowed values: "ids" (Adds the ID of page), "title" (Adds the title and namespace ID of the page), "url" (Adds the URL used in the page).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res._prop(val) or fail ArgumentError, "Unknown value for prop: #{val}" }
      end

      # @private
      def _prop(value)
        defined?(super) && super || ["ids", "title", "url"].include?(value.to_s) && merge(euprop: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def offset(value)
        merge(euoffset: value.to_s)
      end

      # Protocol of the URL. If empty and euquery is set, the protocol is http. Leave both this and euquery empty to list all external links.
      #
      # @param value [String] One of "bitcoin", "ftp", "ftps", "geo", "git", "gopher", "http", "https", "irc", "ircs", "magnet", "mailto", "mms", "news", "nntp", "redis", "sftp", "sip", "sips", "sms", "ssh", "svn", "tel", "telnet", "urn", "worldwind", "xmpp".
      # @return [self]
      def protocol(value)
        _protocol(value) or fail ArgumentError, "Unknown value for protocol: #{value}"
      end

      # @private
      def _protocol(value)
        defined?(super) && super || ["bitcoin", "ftp", "ftps", "geo", "git", "gopher", "http", "https", "irc", "ircs", "magnet", "mailto", "mms", "news", "nntp", "redis", "sftp", "sip", "sips", "sms", "ssh", "svn", "tel", "telnet", "urn", "worldwind", "xmpp"].include?(value.to_s) && merge(euprotocol: value.to_s)
      end

      # Search string without protocol. See Special:LinkSearch. Leave empty to list all external links.
      #
      # @param value [String]
      # @return [self]
      def query(value)
        merge(euquery: value.to_s)
      end

      # The page namespaces to enumerate.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res._namespace(val) or fail ArgumentError, "Unknown value for namespace: #{val}" }
      end

      # @private
      def _namespace(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(eunamespace: value.to_s)
      end

      # How many pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(eulimit: value.to_s)
      end

      # Expand protocol-relative URLs with the canonical protocol.
      #
      # @return [self]
      def expandurl()
        merge(euexpandurl: 'true')
      end
    end
  end
end
