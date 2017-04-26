# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns all external URLs (not interwikis) from the given pages. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.extlinks(**options).perform # returns string with raw output
    # # or
    # api.some_action.extlinks(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.extlinks.limit(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
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
        merge(elprotocol: value.to_s)
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
