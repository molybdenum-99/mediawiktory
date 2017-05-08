# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Associate or disassociate a user as instructor or volunteer for a course. 
    #
    # Usage:
    #
    # ```ruby
    # api.enlist.subaction(value).perform # returns string with raw output
    # # or
    # api.enlist.subaction(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Enlist < MediaWiktory::Wikipedia::Actions::Post

      # Specifies what you want to do with the instructor or volunteer.
      #
      # @param value [String] One of "add", "remove".
      # @return [self]
      def subaction(value)
        _subaction(value) or fail ArgumentError, "Unknown value for subaction: #{value}"
      end

      # @private
      def _subaction(value)
        defined?(super) && super || ["add", "remove"].include?(value.to_s) && merge(subaction: value.to_s)
      end

      # The role to affect. "instructor" for instructor, "online" for online volunteer and "campus" for campus volunteer.
      #
      # @param value [String] One of "instructor", "online", "campus", "student".
      # @return [self]
      def role(value)
        _role(value) or fail ArgumentError, "Unknown value for role: #{value}"
      end

      # @private
      def _role(value)
        defined?(super) && super || ["instructor", "online", "campus", "student"].include?(value.to_s) && merge(role: value.to_s)
      end

      # Name of the user to associate or disassociate.
      #
      # @param value [String]
      # @return [self]
      def username(value)
        merge(username: value.to_s)
      end

      # ID of the user to associate or disassociate.
      #
      # @param value [Integer]
      # @return [self]
      def userid(value)
        merge(userid: value.to_s)
      end

      # The ID of the course.
      #
      # @param value [Integer]
      # @return [self]
      def courseid(value)
        merge(courseid: value.to_s)
      end

      # Reason for this deletion, for the log.
      #
      # @param value [String]
      # @return [self]
      def reason(value)
        merge(reason: value.to_s)
      end

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end
    end
  end
end
