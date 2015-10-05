require 'pp'

require 'bundler/setup'
require 'faraday'
require 'nokogiri'

$:.unshift 'lib'
require 'faraday/naive_cache'
require 'nokogiri/more'

start = '/w/api.php?action=help'

module Api
  class << self
    def client
      @client ||= Faraday.new('https://en.wikipedia.org') do |builder|
        builder.use Faraday::NaiveCache
        builder.adapter Faraday.default_adapter
      end
    end
  end

  class Module
    attr_reader :url, :header, :prefix, :flags, :description, :params

    def initialize(url)
      @url = url
      parse(Nokogiri::HTML(Api.client.get(url).body))
    end

    def parse(doc)
    
      header = doc.at('.apihelp-header').text
      @header, @prefix = if header =~ /^(.+)\s+\((.+)\)$/
        [$1, $2]
      else
        [header, nil]
      end

      @flags = Flags.new(doc.at('.apihelp-flags'))
      if @flags.include?('apihelp-unknown')
        p url
      end
      @description = if desc = doc.at('.apihelp-flags + p')
        desc.text.strip
      end
      if doc.at('.apihelp-parameters > dl')
        @params = doc.at('.apihelp-parameters > dl').
          each_term.to_a.
          map{|tms, tds| Parameter.new(tms.first.text, tds)}
        @params.each{|p| p.prefix!(@prefix)} if @prefix
      else
        @params = []
      end
    end

    def to_hash
      {
        header: header,
        description: description,
        flags: flags,
        prefix: prefix,
        params: params.map(&:to_hash)
      }
    end

    def to_help(level = 0)
      '  ' * level + 
        "#{header} (#{flags.to_help}): #{description}\n" +
        params.map{|p| p.to_help(level + 1)}.join("\n")
    end
  end

  class Flags
    def initialize(div)
      @raw = div.search('ul li > span').to_a.map{|el|
        {id: el.attr('class'), text: el.text}
      }
      @@all ||= []
      @@all.concat @raw.map{|r| r[:id]}
    end

    def include?(flag)
      @raw.map{|f| f[:id]}.include?(flag)
    end

    def self.all
      @@all
    end

    def to_help
      @raw.map{|f| f[:id].sub(/^apihelp-(flag-)?/, '')}.join(',')
    end
  end

  class ParameterValue
    attr_reader :name, :url, :module
    attr_accessor :description

    def initialize(name)
      @name = name
    end

    def parse(url)
      @url = url
      @module = Module.new(url) unless @name == 'generator'
    end

    def empty?
      !@description && !@module
    end

    def to_help(level = 0)
      if self.module
        '  ' * level + "#{name}: " + self.module.to_help(level+1).sub(/\A\s+/, '')
      else
        '  ' * level + "#{name}: #{description}"
      end
    end
  end

  class Parameter
    attr_reader :name, :full_name, :description, :type, :values, :default, :help, :info

    def initialize(name, defs)
      @name = @full_name = name
      @values = Hash.new{|h,k| h[k] = ParameterValue.new(k) }
      @info = []
      
      defs.each do |el|
        parse_def(el)
      end
    end

    def prefix!(pref)
      if @full_name.start_with?(pref)
        @name = @full_name.sub(/^#{pref}/, '')
      end
    end

    def to_hash
      {
        name: name,
        full_name: name == full_name ? nil : full_name,
        description: description,
        type: type,
        values: values.all?{|k,v| v.empty?} ? values.keys : values,
        default: default,
        help: help,
        info: info
      }.reject{|k,v| v.nil? || v == [] || v == {}}
    end

    def to_help(level = 1)
      '  ' * level +
        [name,
          type && " (#{type})",
          ': ',
          description,
          default && " (default #{default})"
        ].reject{|l| !l}.join +
          if values.empty?
            ''
          elsif values.all?{|k, v| v.empty?}
            "\n" + '  ' * (level+1) + values.keys.join(', ')
          else
            "\n" + values.map{|key, val| val.to_help(level + 1)}.join("\n")
          end
    end

    def parse_def(el)
      case el.attr('class')
      when 'description'
        parse_description(el)
      when 'info'
        parse_info(el)
      else
        fail "Unparseable element: #{el.outer_html}"
      end
    end

    def parse_description(el)
      if el.at('dl')
        @description = el.at('p').text.strip
        el.at('dl').each_term.map{|dts, dds|
          @values[dts.first.text].description = dds.first.text
        }
      else
        @description = el.text.strip
      end
    end

    def parse_info(el)
      case el.text
      when /^Default:\s*(.+)$/
        @default = $1
      when /^Type: ([^\(]+)\s*($|\()/
        @type = $1.strip
      when /^(One of) the following values:\s*(.+)$/,
           /^(Values) \(separate with \|\):\s*(.+)$/

        @type = $1 == 'One of' ? 'one of' : 'several'
        if el.at('a')
          el.search('a').each do |a|
            @values[a.text].parse(a.attr('href'))
          end
        else
          $2.split(',').map(&:strip).map{|val|
              val.sub(/^(Can be |or )/, '') # Wtf?.. https://en.wikipedia.org/w/api.php?action=help&modules=query%2Bextlinks
            }.each{|n| @values[n]}
        end
      when /^Separate values with/
        @help = el.text
      else
        @info << el.text
      end
    end
  end
end

require 'yaml'

#start = '/w/api.php?action=help'
#File.write 'tmp/api.yaml', Api::Module.new('/w/api.php?action=help').to_hash.to_yaml
#File.write 'tmp/api.yaml', Api::Module.new('/w/api.php?action=help&modules=query').to_hash.to_yaml
#pp Api::Module.new("/w/api.php?action=help&modules=query%2Bextlinks").to_hash

main = Api::Module.new('/w/api.php?action=help')
#puts main.to_help
pp Api::Flags.all.group_by(&:itself).map{|f,c| [f, c.count]}.to_h

__END__

TODO:
  generators — отдельная штука, их надо обрабатывать
  separate with, max values → признак того, что єто список!
  node naught — конвертировать в nil?..
