# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Get the usernames and other information for students enrolled in one or more courses. 
    #
    # Usage:
    #
    # ```ruby
    # api.liststudents.courseids(value).perform # returns string with raw output
    # # or
    # api.liststudents.courseids(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Liststudents < MediaWiktory::Wikipedia::Actions::Get

      # IDs of the courses.
      #
      # @param values [Array<Integer>]
      # @return [self]
      def courseids(*values)
        values.inject(self) { |res, val| res._courseids(val) }
      end

      # @private
      def _courseids(value)
        merge(courseids: value.to_s)
      end

      # Which property to get for each student:
      #
      # @param value [String] One of "username" (The username of the student), "id" (The user ID of the student).
      # @return [self]
      def prop(value)
        _prop(value) or fail ArgumentError, "Unknown value for prop: #{value}"
      end

      # @private
      def _prop(value)
        defined?(super) && super || ["username", "id"].include?(value.to_s) && merge(prop: value.to_s)
      end

      # If given, the query will group students by course.
      #
      # @return [self]
      def group()
        merge(group: 'true')
      end

      # If given, the query will return usernames in CSV format, and it will return the articles assigned to those students.
      #
      # @return [self]
      def csv()
        merge(csv: 'true')
      end
    end
  end
end
