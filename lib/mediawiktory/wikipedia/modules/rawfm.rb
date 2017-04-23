module MediaWiktory::Wikipedia::Modules
  # Output data, including debugging elements, in JSON format (pretty-print in HTML). 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.rawfm(**options).perform # returns string with raw output
  # # or
  # api.some_action.rawfm(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.rawfm.wrappedhtml(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Rawfm < MediaWiktory::Submodule
    # Return the pretty-printed HTML and associated ResourceLoader modules as a JSON object.
    #
    # @return [self]
    def wrappedhtml()
      merge(wrappedhtml: 'true')
    end

  end
end
