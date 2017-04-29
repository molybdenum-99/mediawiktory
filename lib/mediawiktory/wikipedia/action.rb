# frozen_string_literal: true

module MediaWiktory::Wikipedia
  class Action
    attr_reader :client

    def initialize(client, options = {})
      @client = client
      @params = stringify_hash(options)
      @submodules = []
    end

    def merge(hash)
      self.class
          .new(@client, @params.merge(stringify_hash(hash)))
          .tap { |action| @submodules.each { |sm| action.submodule(sm) } }
    end

    def to_h
      @params.dup
    end

    def name
      # Query # => query
      # ParsoidBatch # => parsoid-batch
      self.class.name.scan(/(\w+)$/).flatten.first
        &.gsub(/([a-z])([A-Z])/, '\1-\2')
        &.downcase or
        fail ArgumentError, "Can't guess action name from #{self.class.name}"
    end

    def to_param
      to_h.merge('action' => name)
    end

    def to_url
      url = @client.url
      url.query_values = to_param
      url.to_s
    end

    def perform
      fail NotImplementedError,
           'Action is abstract, all actions should descend from GetAction or PostAction'
    end

    def response
      jsonable = format(:json)
      Response.parse(jsonable, jsonable.perform)
    end

      # The format of the output.
      #
      # @param value [Symbol] Selecting an option includes tweaking methods from corresponding module:
    #   * `:json` - {MediaWiktory::Wikipedia::Modules::Json} Output data in JSON format. 
    #   * `:jsonfm` - {MediaWiktory::Wikipedia::Modules::Jsonfm} Output data in JSON format (pretty-print in HTML). 
    #   * `:none` - {MediaWiktory::Wikipedia::Modules::None} Output nothing. 
    #   * `:php` - {MediaWiktory::Wikipedia::Modules::Php} Output data in serialized PHP format. 
    #   * `:phpfm` - {MediaWiktory::Wikipedia::Modules::Phpfm} Output data in serialized PHP format (pretty-print in HTML). 
    #   * `:rawfm` - {MediaWiktory::Wikipedia::Modules::Rawfm} Output data, including debugging elements, in JSON format (pretty-print in HTML). 
    #   * `:xml` - {MediaWiktory::Wikipedia::Modules::Xml} Output data in XML format. 
    #   * `:xmlfm` - {MediaWiktory::Wikipedia::Modules::Xmlfm} Output data in XML format (pretty-print in HTML). 
      # @return [self]
      def format(value)
        merge_module(:format, value, json: Modules::Json, jsonfm: Modules::Jsonfm, none: Modules::None, php: Modules::Php, phpfm: Modules::Phpfm, rawfm: Modules::Rawfm, xml: Modules::Xml, xmlfm: Modules::Xmlfm)
      end

      # Maximum lag can be used when MediaWiki is installed on a database replicated cluster. To save actions causing any more site replication lag, this parameter can make the client wait until the replication lag is less than the specified value. In case of excessive lag, error code maxlag is returned with a message like Waiting for $host: $lag seconds lagged.See Manual: Maxlag parameter for more information.
      #
      # @param value [Integer]
      # @return [self]
      def maxlag(value)
        merge(maxlag: value.to_s)
      end

      # Set the s-maxage HTTP cache control header to this many seconds. Errors are never cached.
      #
      # @param value [Integer]
      # @return [self]
      def smaxage(value)
        merge(smaxage: value.to_s)
      end

      # Set the max-age HTTP cache control header to this many seconds. Errors are never cached.
      #
      # @param value [Integer]
      # @return [self]
      def maxage(value)
        merge(maxage: value.to_s)
      end

      # Verify the user is logged in if set to user, or has the bot user right if bot.
      #
      # @param value [String] One of "user", "bot".
      # @return [self]
      def assert(value)
        merge(assert: value.to_s)
      end

      # Verify the current user is the named user.
      #
      # @param value [String]
      # @return [self]
      def assertuser(value)
        merge(assertuser: value.to_s)
      end

      # Any value given here will be included in the response. May be used to distinguish requests.
      #
      # @param value [String]
      # @return [self]
      def requestid(value)
        merge(requestid: value.to_s)
      end

      # Include the hostname that served the request in the results.
      #
      # @return [self]
      def servedby()
        merge(servedby: 'true')
      end

      # Include the current timestamp in the result.
      #
      # @return [self]
      def curtimestamp()
        merge(curtimestamp: 'true')
      end

      # Include the languages used for uselang and errorlang in the result.
      #
      # @return [self]
      def responselanginfo()
        merge(responselanginfo: 'true')
      end

      # When accessing the API using a cross-domain AJAX request (CORS), set this to the originating domain. This must be included in any pre-flight request, and therefore must be part of the request URI (not the POST body).
      #
      # @param value [String]
      # @return [self]
      def origin(value)
        merge(origin: value.to_s)
      end

      # Language to use for message translations. action=query&meta=siteinfo with siprop=languages returns a list of language codes, or specify user to use the current user's language preference, or specify content to use this wiki's content language.
      #
      # @param value [String]
      # @return [self]
      def uselang(value)
        merge(uselang: value.to_s)
      end

      # Format to use for warning and error text output.
      #
      # @param value [String] One of " plaintext" ( Wikitext with HTML tags removed and entities replaced), " wikitext" ( Unparsed wikitext), " html" ( HTML), " raw" ( Message key and parameters), " none" ( No text output, only the error codes), " bc" ( Format used prior to MediaWiki 1.29. errorlang and errorsuselocal are ignored).
      # @return [self]
      def errorformat(value)
        merge(errorformat: value.to_s)
      end

      # Language to use for warnings and errors. action=query&meta=siteinfo with siprop=languages returns a list of language codes, or specify content to use this wiki's content language, or specify uselang to use the same value as the uselang parameter.
      #
      # @param value [String]
      # @return [self]
      def errorlang(value)
        merge(errorlang: value.to_s)
      end

      # If given, error texts will use locally-customized messages from the MediaWiki namespace.
      #
      # @return [self]
      def errorsuselocal()
        merge(errorsuselocal: 'true')
      end

      # When accessing the API using a cross-domain AJAX request (CORS), use this to authenticate as the current SUL user. Use action=centralauthtoken on this wiki to retrieve the token, before making the CORS request. Each token may only be used once, and expires after 10 seconds. This should be included in any pre-flight request, and therefore should be included in the request URI (not the POST body).
      #
      # @param value [String]
      # @return [self]
      def centralauthtoken(value)
        merge(centralauthtoken: value.to_s)
      end

    private

    # Used by generated code in methods like
    #
    # ```ruby
    # action.format(:json)
    # ```
    #
    # It merges used module name into action params and includes submodule's methods into action
    # for further tweaking.
    def merge_module(name, val, modules)
      mod = modules.fetch(val) { fail ArgumentError, "Module #{val} is not defined" }
      merge(name => val).submodule(mod)
    end

    def merge_modules(name, vals, modules)
      mods =
        vals
        .map { |val| modules.fetch(val) { fail ArgumentError, "Module #{val} is not defined" } }
      merge(name => vals.join('|')).tap { |res| mods.each { |mod| res.submodule(mod) } }
    end

    # Not in indepented module to decrease generated files/modules list
    def stringify_hash(hash, recursive: false)
      hash.map { |k, v|
        [k.to_s, v.is_a?(Hash) && recursive ? stringify_hash(v, recursive: true) : v.to_s]
      }.to_h
    end

    protected

    def submodule(mod)
      extend(mod)
      @submodules << mod
      self
    end
  end

  class GetAction < Action
    def perform
      client.get(to_param)
    end
  end

  class PostAction < Action
    def perform
      client.post(to_param)
    end
  end
end
