require 'naught'

# @private
# Used only by Generator
module Nokogiri
  module More
    module NodeChildrenGroups
      def children_groups(*selectors)
        groups = []
        flat = children.select{ |node| selectors.any?{ |s| node.matches?(s) } }
        until flat.empty?
          groups << make_group(flat, selectors)
        end
        groups
      end

      #include NodeOnlyFor

      def each_term
        children_groups('dt', 'dd')
      end

      private

      def make_group(flat, selectors)
        sel = selectors.dup
        group = [[]]
        until flat.empty?
          if flat.first.matches?(sel.first)
            group.last << flat.shift
          elsif sel.size > 1 && flat.first.matches?(sel[1])
            sel.shift
            group << []
            group.last << flat.shift
          else
            break
          end
        end
        group
      end
    end

    NodeNaught = Naught.build do |config|
      config.black_hole

      # so you can just `at?(selector).tap{|node| ...`
      # and never be inside `tap`, if it's not found
      def tap
        self
      end
    end

    module NodeQuestMethods
      def at?(selector)
        at(selector) || NodeNaught.new
      end

      def at_css?(selector)
        at_css(selector) || NodeNaught.new
      end

      def at_xpath?(selector)
        at_xpath(selector) || NodeNaught.new
      end

      def find_child?(selector)
        find_child(selector) || NodeNaught.new
      end
    end
  end

  Nokogiri::XML::Node.send(:include, More::NodeChildrenGroups)
  Nokogiri::XML::Node.send(:include, More::NodeQuestMethods)
end
