# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Add multiple students to a course. 
    #
    # Usage:
    #
    # ```ruby
    # api.addstudents(**options).perform # returns string with raw output
    # # or
    # api.addstudents(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.addstudents.studentusernames(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Addstudents < MediaWiktory::Wikipedia::Actions::Post

      # The usernames of the students to add to the course.
      #
      # @param values [Array<String>]
      # @return [self]
      def studentusernames(*values)
        values.inject(self) { |res, val| res._studentusernames(val) }
      end

      # @private
      def _studentusernames(value)
        merge(studentusernames: value.to_s)
      end

      # The ID of the course to which the students should be added/removed.
      #
      # @param value [Integer]
      # @return [self]
      def courseid(value)
        merge(courseid: value.to_s)
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
