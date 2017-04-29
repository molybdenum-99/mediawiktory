# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Associate or disassociate a user as instructor or volunteer for a course. 
    #
    # Usage:
    #
    # ```ruby
    # api.enlist(**options).perform # returns string with raw output
    # # or
    # api.enlist(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.enlist.subaction(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Enlist < MediaWiktory::Wikipedia::Actions::Post

      # Specifies what you want to do with the instructor or volunteer.
      #
      # @param value [String] One of "add", "remove".
      # @return [self]
      def subaction(value)
        merge(subaction: value.to_s)
      end

      # The role to affect. "instructor" for instructor, "online" for online volunteer and "campus" for campus volunteer.
      #
      # @param value [String] One of "instructor", "online", "campus", "student".
      # @return [self]
      def role(value)
        merge(role: value.to_s)
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
