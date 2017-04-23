module MediaWiktory::Wikipedia::Modules
  # Returns information about images on the page, such as thumbnail and presence of photos. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.pageimages(**options).perform # returns string with raw output
  # # or
  # api.some_action.pageimages(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.pageimages.prop(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Pageimages
    # Which information to return:
    #
    # @param values [Array<String>] Allowed values: "thumbnail" (URL and dimensions of thumbnail image associated with page, if any), "original" (URL and original dimensions of image associated with page, if any), "name" (Image title).
    # @return [self]
    def prop(*values)
      merge(piprop: values.join('|'))
    end
    # Maximum thumbnail dimension.
    #
    # @param value [Integer]
    # @return [self]
    def thumbsize(value)
      merge(pithumbsize: value.to_s)
    end
    # Properties of how many pages to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(pilimit: value.to_s)
    end
    # Limit page images to a certain license type
    #
    # @param value [String] One of "free", "any".
    # @return [self]
    def license(value)
      merge(pilicense: value.to_s)
    end
    # When more results are available, use this to continue.
    #
    # @param value [Integer]
    # @return [self]
    def continue(value)
      merge(picontinue: value.to_s)
    end
  end
end
