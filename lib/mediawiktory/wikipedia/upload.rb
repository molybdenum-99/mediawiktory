# Upload a file, or get the status of pending uploads.
#
# Several methods are available:
#
# Note that the HTTP POST must be done as a file upload (i.e. using multipart/form-data) when sending the file.
#
# Usage:
#
# ```ruby
# api.upload(**options).perform # returns string with raw output
# # or
# api.upload(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.upload.filename(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Upload < GetAction
  # Target filename.
  #
  # @param value [String]
  # @return [self]
  def filename(value)
    merge(filename: value.to_s)
  end
  # Upload comment. Also used as the initial page text for new files if text is not specified.
  #
  # @param value [String]
  # @return [self]
  def comment(value)
    merge(comment: value.to_s)
  end
  # Change tags to apply to the upload log entry and file page revision.
  #
  # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
  # @return [self]
  def tags(*values)
    merge(tags: values.join('|'))
  end
  # Initial page text for new files.
  #
  # @param value [String]
  # @return [self]
  def text(value)
    merge(text: value.to_s)
  end
  # Watch the page.
  #
  # @param value [true, false]
  # @return [self]
  def watch(value = true)
    merge(watch: 'true') if value
  end
  # Unconditionally add or remove the page from the current user's watchlist, use preferences or do not change watch.
  #
  # @param value [String] One of "watch", "preferences", "nochange".
  # @return [self]
  def watchlist(value)
    merge(watchlist: value.to_s)
  end
  # Ignore any warnings.
  #
  # @param value [true, false]
  # @return [self]
  def ignorewarnings(value = true)
    merge(ignorewarnings: 'true') if value
  end
  # File contents.
  #
  # @param value [String]
  # @return [self]
  def file(value)
    merge(file: value.to_s)
  end
  # URL to fetch the file from.
  #
  # @param value [String]
  # @return [self]
  def url(value)
    merge(url: value.to_s)
  end
  # Key that identifies a previous upload that was stashed temporarily.
  #
  # @param value [String]
  # @return [self]
  def filekey(value)
    merge(filekey: value.to_s)
  end
  # Same as filekey, maintained for backward compatibility.
  #
  # @param value [String]
  # @return [self]
  def sessionkey(value)
    merge(sessionkey: value.to_s)
  end
  # If set, the server will stash the file temporarily instead of adding it to the repository.
  #
  # @param value [true, false]
  # @return [self]
  def stash(value = true)
    merge(stash: 'true') if value
  end
  # Filesize of entire upload.
  #
  # @param value [Integer]
  # @return [self]
  def filesize(value)
    merge(filesize: value.to_s)
  end
  # Offset of chunk in bytes.
  #
  # @param value [Integer]
  # @return [self]
  def offset(value)
    merge(offset: value.to_s)
  end
  # Chunk contents.
  #
  # @param value [String]
  # @return [self]
  def chunk(value)
    merge(chunk: value.to_s)
  end
  # Make potentially large file operations asynchronous when possible.
  #
  # @param value [true, false]
  # @return [self]
  def async(value = true)
    merge(async: 'true') if value
  end
  # Only fetch the upload status for the given file key.
  #
  # @param value [true, false]
  # @return [self]
  def checkstatus(value = true)
    merge(checkstatus: 'true') if value
  end
  # A "csrf" token retrieved from action=query&meta=tokens
  #
  # @param value [String]
  # @return [self]
  def token(value)
    merge(token: value.to_s)
  end

end