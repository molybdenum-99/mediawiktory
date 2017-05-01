# frozen_string_literal: true

# MediaWiktory is wrapper and wrapper generator for [MediaWiki API](https://www.mediawiki.org/wiki/API:Main_page).
#
# There are two ways of using MediaWiktory:
#
# 1. either to generate your own wrapper (see {README} for explanations why and how to do it), or
# 2. by using default wrapper, generated from recent Wikipedia docs, see {MediaWiktory::Wikipedia::Api}.
#
module MediaWiktory
  require_relative 'mediawiktory/version'
  require_relative 'mediawiktory/wikipedia'
end
