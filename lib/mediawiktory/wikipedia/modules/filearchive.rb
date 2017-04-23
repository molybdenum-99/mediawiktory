module MediaWiktory::Wikipedia::Modules
  # Enumerate all deleted files sequentially. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.filearchive(**options).perform # returns string with raw output
  # # or
  # api.some_action.filearchive(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.filearchive.from(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Filearchive < MediaWiktory::Submodule
    # The image title to start enumerating from.
    #
    # @param value [String]
    # @return [self]
    def from(value)
      merge(fafrom: value.to_s)
    end
    # The image title to stop enumerating at.
    #
    # @param value [String]
    # @return [self]
    def to(value)
      merge(fato: value.to_s)
    end
    # Search for all image titles that begin with this value.
    #
    # @param value [String]
    # @return [self]
    def prefix(value)
      merge(faprefix: value.to_s)
    end
    # The direction in which to list.
    #
    # @param value [String] One of "ascending", "descending".
    # @return [self]
    def dir(value)
      merge(fadir: value.to_s)
    end
    # SHA1 hash of image. Overrides fasha1base36.
    #
    # @param value [String]
    # @return [self]
    def sha1(value)
      merge(fasha1: value.to_s)
    end
    # SHA1 hash of image in base 36 (used in MediaWiki).
    #
    # @param value [String]
    # @return [self]
    def sha1base36(value)
      merge(fasha1base36: value.to_s)
    end
    # Which image information to get:
    #
    # @param values [Array<String>] Allowed values: "sha1" (Adds SHA-1 hash for the image), "timestamp" (Adds timestamp for the uploaded version), "user" (Adds user who uploaded the image version), "size" (Adds the size of the image in bytes and the height, width and page count (if applicable)), "dimensions" (Alias for size), "description" (Adds description of the image version), "parseddescription" (Parse the description of the version), "mime" (Adds MIME of the image), "mediatype" (Adds the media type of the image), "metadata" (Lists Exif metadata for the version of the image), "bitdepth" (Adds the bit depth of the version), "archivename" (Adds the filename of the archive version for non-latest versions).
    # @return [self]
    def prop(*values)
      merge(faprop: values.join('|'))
    end
    # How many images to return in total.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(falimit: value.to_s)
    end
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(facontinue: value.to_s)
    end

  end
end
