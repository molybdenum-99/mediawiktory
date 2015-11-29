require_relative 'array_with_keys'

module MediaWiktory
  class Query
    class Response < Action::Response
      def pages
        @pages ||= ArrayWithKeys.from_hash(raw.query.pages || {})
      end
    end
  end
end
