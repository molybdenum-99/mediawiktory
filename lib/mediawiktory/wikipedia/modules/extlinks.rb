# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns all external URLs (not interwikis) from the given pages. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Extlinks

      # How many links to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(ellimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def offset(value)
        merge(eloffset: value.to_s)
      end

      # Protocol of the URL. If empty and elquery is set, the protocol is http. Leave both this and elquery empty to list all external links.
      #
      # @param value [String] One of "bitcoin", "ftp", "ftps", "geo", "git", "gopher", "http", "https", "irc", "ircs", "magnet", "mailto", "mms", "news", "nntp", "redis", "sftp", "sip", "sips", "sms", "ssh", "svn", "tel", "telnet", "urn", "worldwind", "xmpp".
      # @return [self]
      def protocol(value)
        _protocol(value) or fail ArgumentError, "Unknown value for protocol: #{value}"
      end

      # @private
      def _protocol(value)
        defined?(super) && super || ["bitcoin", "ftp", "ftps", "geo", "git", "gopher", "http", "https", "irc", "ircs", "magnet", "mailto", "mms", "news", "nntp", "redis", "sftp", "sip", "sips", "sms", "ssh", "svn", "tel", "telnet", "urn", "worldwind", "xmpp"].include?(value.to_s) && merge(elprotocol: value.to_s)
      end

      # Search string without protocol. Useful for checking whether a certain page contains a certain external url.
      #
      # @param value [String]
      # @return [self]
      def query(value)
        merge(elquery: value.to_s)
      end

      # Expand protocol-relative URLs with the canonical protocol.
      #
      # @return [self]
      def expandurl()
        merge(elexpandurl: 'true')
      end
    end
  end
end
