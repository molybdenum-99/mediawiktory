require_relative 'array_with_keys'

module MediaWiktory
  class Query
    def continue(additional_params)
      client.get(to_param.merge(additional_params))
    end
  
    class Response < Action::Response
      def pages
        @pages ||= ArrayWithKeys.from_hash(raw.query.pages || {})
      end

      def continue?
        !raw.continue.nil?
      end

      def continue!
        continue? or fail(RuntimeError, "Response can not be continued")
        
        merge!(action.perform(raw.continue))

        self
      end

      def continue
        dup.continue!
      end

      private

      def merge!(other)
        # FIXME: not the brightest code in my life, faithfully
        # FIXME2: after this merge, only @pages are updated, but @raw.query.pages IS NOT
        other.pages.to_h.each do |k, p|
          if (existing = pages[k])
            merge_page(existing, p)
          else
            pages.push(p, p.id)
          end
        end

        raw.continue = other.raw.continue
      end

      def merge_page(existing, other)
        other.each do |k, v|
          case existing[k]
          when Array
            existing[k].concat(v)
          when Hash
            existing[k].merge!(v)
          else
            existing[k] = v
          end
        end
      end
    end
  end
end
