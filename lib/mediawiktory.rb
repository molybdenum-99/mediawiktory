# frozen_string_literal: true

# MediaWiktory is wrapper and wrapper generator for [MediaWiki API](https://www.mediawiki.org/wiki/API:Main_page).
#
# There are two ways of using MediaWiktory:
#
# 1. Either to generate your own wrapper (see {file:README.md} for explanations why and how to do it), or
# 2. By using default wrapper, generated from recent Wikipedia docs, see {MediaWiktory::Wikipedia::Api}.
#    Note, that most of basic features (like "query some pages") of default wrapper could be used
#    with **any** MediaWiki installation, but more advanced features could work differently. Please
#    refer to {file:README.md} for more detailed explanation of those matters.
#
module MediaWiktory
  require_relative 'mediawiktory/version'
  require_relative 'mediawiktory/wikipedia'
end
