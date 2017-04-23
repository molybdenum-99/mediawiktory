module MediaWiktory::Wikipedia::Modules
  # Get transcode status for a given file page. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.transcodestatus(**options).perform # returns string with raw output
  # # or
  # api.some_action.transcodestatus(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.transcodestatus.(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Transcodestatus < MediaWiktory::Submodule

  end
end