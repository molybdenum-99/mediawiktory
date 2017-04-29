# frozen_string_literal: true

require 'liquid'

module MediaWiktory
  class Generator
    class Param < Hashie::Mash
      class << self
        def from_html_nodes(name, dds, prefix: nil)
          new(
            full_name: name,
            name: name.sub(/^#{prefix}/, ''),
            prefix: prefix,
            description: extract_description(dds),
            type: extract_type(dds),
            vals: extract_values(dds)

            # TODO: lost params
            #   limit: extract_limit(dds),
            #   default: extract_default(dds)

            # TODO: mandatoriness:
            # * optional
            # * mandatory
            # * this OR that is mandatory
            # * this AND that can't intersect
            # * and so on
          )
        end

        def extract_description(els)
          els.detect { |e| e.attr('class') == 'description' }.at('p')&.text.to_s.strip.tr("\n", ' ')
        end

        def extract_type(els)
          # TODO: "Expiry time. May be relative (e.g. 5 months or 2 weeks) or absolute
          #   (e.g. 2014-09-18T12:34:56Z). If set to infinite, indefinite, or never, the block will
          #   never expire."
          els.select { |e| e.attr('class') == 'info' }.each do |el|
            case el.text
            when /^Type: ([^\(]+)\s*($|\()/
              return Regexp.last_match(1).strip
            when /^Values \(separate with \|/,
                 /^Separate values with \|/
              return 'list'
            when /^One of the following values:/
              return 'enum'
            end
          end
          'string'
        end

        def extract_default(els)
          els.each { |el| return Regexp.last_match(1) if el =~ /^Default:\s*(.+)$/ }
          nil
        end

        def extract_values(els)
          # 1. try dl from definition
          els.detect { |e| e.attr('class') == 'description' }.tap { |d|
            if d.at('dl')
              return d.at('dl').each_term.map { |dts, dds|
                {name: dts.first.text, description: dds.first.text.tr("\n", ' ')}
              }
            end
          }

          # 2. ...or take from info
          els.select { |e| e.attr('class') == 'info' }.each do |el|
            if el.text =~
               /^(?:One of the following values||Values \(separate with \|.*?\)):\s*(.+)$/
              if el.search('a').count > 1
                return el.search('a').reject { |a| a.text == 'alternative' }
                         .map { |a|
                         {
                           name: a.text,
                           module: a.attr('href').scan(/^.*[\#+](.+)$/).flatten.first
                         }
                       }
              else
                return Regexp.last_match(1).sub(/^Can be empty, or/, '').split(',')
                             .map { |s| s.gsub(/^[[:space:]]|[[:space:]]$/, '') }
              end
            end
          end

          nil
        end
      end

      attr_accessor :api

      def prefix=(pre)
        super
        self.full_name = "#{prefix}#{name}"
      end

      def to_h
        super
          .merge(
            'real_type' => real_type,
            'ruby_type' => ruby_type,
            'param_docs' => param_docs,
            'value_conv' => value_conv,
            'modules' => modules&.map(&:to_h),
            'param_def' => param_def,
            'modules_hash' => modules&.map { |m| module_in_hash(m) }&.join(', ')
          )
      end

      def ruby_type
        case real_type
        when 'string', 'user name', 'enum'
          'String'
        when 'boolean'
          'true, false'
        when 'integer'
          'Integer'
        when 'integer or max'
          'Integer, "max"'
        when 'list', 'list of user names'
          'Array<String>'
        when 'list of integers'
          'Array<Integer>'
        when 'list of timestamps'
          'Array<Time>'
        when 'enum of modules'
          'Symbol'
        when 'list of modules'
          'Array<Symbol>'
        when 'timestamp'
          'Time'
        else
          fail ArgumentError, "Cannot render #{real_type} to Ruby still"
        end
      end

      def module_in_hash(m)
        "#{m.method_name}: Modules::#{m.class_name}"
      end

      def param_docs
        case real_type
        when 'enum'
          " One of #{render_vals}."
        when 'enum of modules'
          ' Selecting an option includes tweaking methods from corresponding module:'
        when 'list of modules'
          ' All selected options include tweaking methods from corresponding modules:'
        when 'list'
          return if !vals || vals.empty?
          " Allowed values: #{render_vals}."
        end
      end

      def render_vals
        if vals.all? { |v| v.is_a?(String) }
          vals.map(&:inspect).join(', ')
        elsif vals.all? { |v| v.is_a?(Hash) && v.key?(:description) }
          vals.map { |v| "#{v[:name].inspect} (#{v[:description].chomp('.')})" }.join(', ')
        elsif modules?
        else
          fail ArgumentError, "Unrenderable values: #{vals}"
        end
      end

      def param_def
        case real_type
        when 'boolean'
          '' # just sets `true` if method was called
        when /^list/
          '*values'
        else
          'value'
        end
      end

      def value_conv
        case real_type
        when 'boolean'
          "'true'" # on false, merge(param: something) not rendered at all
        when 'list of modules'
          "modules_to_hash(values, #{modules.map { |m| m.name.to_sym }})"
        when 'list of timestamps'
          "values.map(&:iso8601).join('|')"
        when /^list/
          "values.join('|')"
        when 'enum of modules'
          "module_to_hash(value, #{modules.map { |m| m.name.to_sym }})"
        when 'timestamp'
          'value.iso8601'
        else
          'value.to_s'
        end
      end

      def real_type
        case type
        when 'enum'
          modules? ? 'enum of modules' : 'enum'
        when 'list'
          modules? ? 'list of modules' : 'list'
        else
          type
        end
      end

      def modules?
        vals&.all? { |v| v.is_a?(Hash) && v.key?(:module) }
      end

      def modules
        modules? ? vals.map { |v| api.module(v.module) } : nil
      end

      include Renderable
    end
  end
end
