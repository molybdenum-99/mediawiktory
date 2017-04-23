module MediaWiktory::Wikipedia::Actions
  # Returns a user contributions feed. 
  #
  # Usage:
  #
  # ```ruby
  # api.feedcontributions(**options).perform # returns string with raw output
  # # or
  # api.feedcontributions(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.feedcontributions.feedformat(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Feedcontributions < MediaWiktory::GetAction
    # The format of the feed.
    #
    # @param value [String] One of "rss", "atom".
    # @return [self]
    def feedformat(value)
      merge(feedformat: value.to_s)
    end
    # What users to get the contributions for.
    #
    # @param value [String]
    # @return [self]
    def user(value)
      merge(user: value.to_s)
    end
    # Which namespace to filter the contributions by.
    #
    # @param value [String] One of "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(value)
      merge(namespace: value.to_s)
    end
    # From year (and earlier).
    #
    # @param value [Integer]
    # @return [self]
    def year(value)
      merge(year: value.to_s)
    end
    # From month (and earlier).
    #
    # @param value [Integer]
    # @return [self]
    def month(value)
      merge(month: value.to_s)
    end
    # Filter contributions that have these tags.
    #
    # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition", "Possible disruption", "Newer user possibly adding unreferenced or improperly referenced material", "possible vandalism", "contenttranslation-needcheck", "possible link spam", "wikilinks removed", "External Link added to disambiguation page", "canned edit summary", "new blank article", "extraneous markup", "de-userfying", "Possible self promotion in userspace", "discretionary sanctions alert", "image added to template", "nowiki added", "userspace spam", "changing height or weight", "possible libel or vandalism", "End of page text", "non-English content", "Extraneous formatting", "reverting anti-vandal bot", "Possible vandalism", "Removal of interwiki link", "Rapid reverts", "adding email address", "nonsense characters", "removal of copyvio templates", "bad external", "large unwikified new article", "removal of articles for deletion template", "Section blanking", "possible cut and paste move", "unusual redirect", "coi-spam", "autobiography", "repeating characters", "categories removed", "removal of Category:Living People", "very short new article", "reference list removal", "references removed", "image template removal", "shouting", "talk page blanking", "blanking", "removal of speedy deletion templates", "self-renaming and bad user talk moves", "mw-contentmodelchange", "massmessage-delivery", "visualeditor", "visualeditor-needcheck", "visualeditor-switched", "visualeditor-wikitext", "wikilove", "mobile edit", "mobile app edit", "mobile web edit", "HHVM", "OAuth CID: 115", "OAuth CID: 142", "OAuth CID: 144", "OAuth CID: 150", "OAuth CID: 151", "OAuth CID: 154", "OAuth CID: 159", "OAuth CID: 194", "OAuth CID: 206", "OAuth CID: 21", "OAuth CID: 211", "OAuth CID: 212", "OAuth CID: 218", "OAuth CID: 236", "OAuth CID: 239", "OAuth CID: 251", "OAuth CID: 252", "OAuth CID: 259", "OAuth CID: 261", "OAuth CID: 263", "OAuth CID: 274", "OAuth CID: 278", "OAuth CID: 285", "OAuth CID: 297", "OAuth CID: 306", "OAuth CID: 314", "OAuth CID: 320", "OAuth CID: 376", "OAuth CID: 410", "OAuth CID: 429", "OAuth CID: 473", "OAuth CID: 540", "OAuth CID: 542", "OAuth CID: 543", "OAuth CID: 563", "OAuth CID: 593", "OAuth CID: 60", "OAuth CID: 612", "OAuth CID: 628", "OAuth CID: 64", "OAuth CID: 651", "OAuth CID: 67", "OAuth CID: 670", "OAuth CID: 678", "OAuth CID: 679", "OAuth CID: 76", "OAuth CID: 817", "OAuth CID: 85", "OAuth CID: 99".
    # @return [self]
    def tagfilter(*values)
      merge(tagfilter: values.join('|'))
    end
    # Show only deleted contributions.
    #
    # @return [self]
    def deletedonly()
      merge(deletedonly: 'true')
    end
    # Only show edits that are the latest revisions.
    #
    # @return [self]
    def toponly()
      merge(toponly: 'true')
    end
    # Only show edits that are page creations.
    #
    # @return [self]
    def newonly()
      merge(newonly: 'true')
    end
    # Hide minor edits.
    #
    # @return [self]
    def hideminor()
      merge(hideminor: 'true')
    end
    # Disabled due to miser mode.
    #
    # @return [self]
    def showsizediff()
      merge(showsizediff: 'true')
    end

  end
end
