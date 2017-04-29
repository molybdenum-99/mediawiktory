# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.allimages(**options).perform # returns string with raw output
    # # or
    # api.some_action.allimages(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.allimages.sort(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GAllimages

      # Property to sort by.
      #
      # @param value [String] One of "name", "timestamp".
      # @return [self]
      def sort(value)
        merge(gaisort: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending", "newer", "older".
      # @return [self]
      def dir(value)
        merge(gaidir: value.to_s)
      end

      # The image title to start enumerating from. Can only be used with aisort=name.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(gaifrom: value.to_s)
      end

      # The image title to stop enumerating at. Can only be used with aisort=name.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(gaito: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gaicontinue: value.to_s)
      end

      # The timestamp to start enumerating from. Can only be used with aisort=timestamp.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(gaistart: value.iso8601)
      end

      # The timestamp to end enumerating. Can only be used with aisort=timestamp.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(gaiend: value.iso8601)
      end

      # Search for all image titles that begin with this value. Can only be used with aisort=name.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(gaiprefix: value.to_s)
      end

      # Limit to images with at least this many bytes.
      #
      # @param value [Integer]
      # @return [self]
      def minsize(value)
        merge(gaiminsize: value.to_s)
      end

      # Limit to images with at most this many bytes.
      #
      # @param value [Integer]
      # @return [self]
      def maxsize(value)
        merge(gaimaxsize: value.to_s)
      end

      # SHA1 hash of image. Overrides aisha1base36.
      #
      # @param value [String]
      # @return [self]
      def sha1(value)
        merge(gaisha1: value.to_s)
      end

      # SHA1 hash of image in base 36 (used in MediaWiki).
      #
      # @param value [String]
      # @return [self]
      def sha1base36(value)
        merge(gaisha1base36: value.to_s)
      end

      # Only return files uploaded by this user. Can only be used with aisort=timestamp. Cannot be used together with aifilterbots.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(gaiuser: value.to_s)
      end

      # How to filter files uploaded by bots. Can only be used with aisort=timestamp. Cannot be used together with aiuser.
      #
      # @param value [String] One of "all", "bots", "nobots".
      # @return [self]
      def filterbots(value)
        merge(gaifilterbots: value.to_s)
      end

      # Disabled due to miser mode.
      #
      # @param values [Array<String>]
      # @return [self]
      def mime(*values)
        merge(gaimime: values.join('|'))
      end

      # How many images in total to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gailimit: value.to_s)
      end
    end
  end
end
