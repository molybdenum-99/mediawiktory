# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Return messages from this site. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.allmessages(**options).perform # returns string with raw output
  # # or
  # api.some_action.allmessages(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.allmessages.messages(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Allmessages
    # Which messages to output. * (default) means all messages.
    #
    # @param values [Array<String>]
    # @return [self]
    def messages(*values)
      merge(ammessages: values.join('|'))
    end
    # Which properties to get.
    #
    # @param values [Array<String>] Allowed values: "default".
    # @return [self]
    def prop(*values)
      merge(amprop: values.join('|'))
    end
    # Set to enable parser, will preprocess the wikitext of message (substitute magic words, handle templates, etc.).
    #
    # @return [self]
    def enableparser()
      merge(amenableparser: 'true')
    end
    # If set, do not include the content of the messages in the output.
    #
    # @return [self]
    def nocontent()
      merge(amnocontent: 'true')
    end
    # Also include local messages, i.e. messages that don't exist in the software but do exist as in the MediaWiki namespace. This lists all MediaWiki-namespace pages, so it will also list those that aren't really messages such as Common.js.
    #
    # @return [self]
    def includelocal()
      merge(amincludelocal: 'true')
    end
    # Arguments to be substituted into message.
    #
    # @param values [Array<String>]
    # @return [self]
    def args(*values)
      merge(amargs: values.join('|'))
    end
    # Return only messages with names that contain this string.
    #
    # @param value [String]
    # @return [self]
    def filter(value)
      merge(amfilter: value.to_s)
    end
    # Return only messages in this customisation state.
    #
    # @param value [String] One of "all", "modified", "unmodified".
    # @return [self]
    def customised(value)
      merge(amcustomised: value.to_s)
    end
    # Return messages in this language.
    #
    # @param value [String]
    # @return [self]
    def lang(value)
      merge(amlang: value.to_s)
    end
    # Return messages starting at this message.
    #
    # @param value [String]
    # @return [self]
    def from(value)
      merge(amfrom: value.to_s)
    end
    # Return messages ending at this message.
    #
    # @param value [String]
    # @return [self]
    def to(value)
      merge(amto: value.to_s)
    end
    # Page name to use as context when parsing message (for amenableparser option).
    #
    # @param value [String]
    # @return [self]
    def title(value)
      merge(amtitle: value.to_s)
    end
    # Return messages with this prefix.
    #
    # @param value [String]
    # @return [self]
    def prefix(value)
      merge(amprefix: value.to_s)
    end
  end
end
