# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns file information for stashed files. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.stashimageinfo(**options).perform # returns string with raw output
    # # or
    # api.some_action.stashimageinfo(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.stashimageinfo.filekey(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Stashimageinfo

    # Key that identifies a previous upload that was stashed temporarily.
    #
    # @param values [Array<String>]
    # @return [self]
    def filekey(*values)
      merge(siifilekey: values.join('|'))
    end

    # Alias for siifilekey, for backward compatibility.
    #
    # @param values [Array<String>]
    # @return [self]
    def sessionkey(*values)
      merge(siisessionkey: values.join('|'))
    end

    # Which file information to get:
    #
    # @param values [Array<String>] Allowed values: "timestamp" (Adds timestamp for the uploaded version), "canonicaltitle" (Adds the canonical title of the file), "url" (Gives URL to the file and the description page), "size" (Adds the size of the file in bytes and the height, width and page count (if applicable)), "dimensions" (Alias for size), "sha1" (Adds SHA-1 hash for the file), "mime" (Adds MIME type of the file), "thumbmime" (Adds MIME type of the image thumbnail (requires url and param siiurlwidth)), "metadata" (Lists Exif metadata for the version of the file), "commonmetadata" (Lists file format generic metadata for the version of the file), "extmetadata" (Lists formatted metadata combined from multiple sources. Results are HTML formatted), "bitdepth" (Adds the bit depth of the version), "badfile" (Adds whether the file is on the MediaWiki:Bad image list).
    # @return [self]
    def prop(*values)
      merge(siiprop: values.join('|'))
    end

    # If siiprop=url is set, a URL to an image scaled to this width will be returned. For performance reasons if this option is used, no more than 50 scaled images will be returned.
    #
    # @param value [Integer]
    # @return [self]
    def urlwidth(value)
      merge(siiurlwidth: value.to_s)
    end

    # Similar to siiurlwidth.
    #
    # @param value [Integer]
    # @return [self]
    def urlheight(value)
      merge(siiurlheight: value.to_s)
    end

    # A handler specific parameter string. For example, PDFs might use page15-100px. siiurlwidth must be used and be consistent with siiurlparam.
    #
    # @param value [String]
    # @return [self]
    def urlparam(value)
      merge(siiurlparam: value.to_s)
    end
  end
  end
end
