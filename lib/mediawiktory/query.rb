require_relative 'page'

module MediaWiktory
  class Query
    def continue(additional_params)
      client.get(to_param.merge(additional_params))
    end
  
    class Response < Action::Response
      attr_reader :pages, :continue_params
      
      def initialize(*)
        super
        @pages = ((raw.query.pages if raw.query) || {}).values.map(&Page.method(:new))
        @continue_params = raw.continue && raw.continue.dup
      end

      def initialize_copy(other)
        super(other)
        @pages = other.pages.dup
      end

      def continue?
        !@continue_params.nil?
      end

      def continue!
        continue? or fail(RuntimeError, "Response can not be continued")
        
        merge!(action.perform(@continue_params))

        self
      end

      def continue
        dup.continue!
      end

      private

      def merge!(other)
        # FIXME: not the brightest code in my life, faithfully
        # FIXME2: after this merge, only @pages are updated, but @raw.query.pages IS NOT
        other.pages.each do |other_page|
          existing = pages.detect{ |p| p.id == other_page.id }
          
          if existing
            existing.merge!(other_page)
          else
            pages.push(other_page)
          end
        end

        @continue_params = other.continue_params
      end
    end
  end
end
