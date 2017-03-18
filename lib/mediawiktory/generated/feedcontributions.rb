module MediaWiktory
  class Feedcontributions < Action
    symbol :feedcontributions
    param :feedformat, Params::Enum[:rss, :atom]
    param :user, Params::String
    param :namespace, Params::Enum[:"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"446", :"447", :"710", :"711", :"828", :"829", :"2300", :"2301", :"2302", :"2303"]
    param :year, Params::Integer
    param :month, Params::Integer
    param :tagfilter, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition, :Neweruserpossiblyaddingunreferencedorimproperlyreferencedmaterial, :possiblevandalism, :"contenttranslation-needcheck", :possiblelinkspam, :wikilinksremoved, :ExternalLinkaddedtodisambiguationpage, :cannededitsummary, :newblankarticle, :extraneousmarkup, :"de-userfying", :Possibleselfpromotioninuserspace, :discretionarysanctionsalert, :imageaddedtotemplate, :nowikiadded, :userspacespam, :changingheightorweight, :possiblelibelorvandalism, :Endofpagetext, :"non-Englishcontent", :Extraneousformatting, :"revertinganti-vandalbot", :Possiblevandalism, :Removalofinterwikilink, :Rapidreverts, :addingemailaddress, :nonsensecharacters, :removalofcopyviotemplates, :badexternal, :largeunwikifiednewarticle, :removalofarticlesfordeletiontemplate, :Sectionblanking, :possiblecutandpastemove, :unusualredirect, :"coi-spam", :autobiography, :repeatingcharacters, :categoriesremoved, :"removalofCategory:LivingPeople", :veryshortnewarticle, :referencelistremoval, :referencesremoved, :imagetemplateremoval, :shouting, :talkpageblanking, :blanking, :removalofspeedydeletiontemplates, :"self-renamingandbadusertalkmoves", :"mw-contentmodelchange", :"massmessage-delivery", :visualeditor, :"visualeditor-needcheck", :"visualeditor-switched", :"visualeditor-wikitext", :wikilove, :mobileedit, :mobileappedit, :mobilewebedit, :HHVM, :contenttranslation, :"OAuthCID:115", :"OAuthCID:142", :"OAuthCID:144", :"OAuthCID:150", :"OAuthCID:151", :"OAuthCID:154", :"OAuthCID:159", :"OAuthCID:194", :"OAuthCID:206", :"OAuthCID:21", :"OAuthCID:211", :"OAuthCID:212", :"OAuthCID:218", :"OAuthCID:236", :"OAuthCID:239", :"OAuthCID:251", :"OAuthCID:252", :"OAuthCID:259", :"OAuthCID:261", :"OAuthCID:263", :"OAuthCID:274", :"OAuthCID:278", :"OAuthCID:285", :"OAuthCID:297", :"OAuthCID:306", :"OAuthCID:314", :"OAuthCID:320", :"OAuthCID:376", :"OAuthCID:410", :"OAuthCID:429", :"OAuthCID:473", :"OAuthCID:540", :"OAuthCID:542", :"OAuthCID:543", :"OAuthCID:563", :"OAuthCID:593", :"OAuthCID:60", :"OAuthCID:612", :"OAuthCID:628", :"OAuthCID:64", :"OAuthCID:651", :"OAuthCID:67", :"OAuthCID:670", :"OAuthCID:678", :"OAuthCID:679", :"OAuthCID:76", :"OAuthCID:85", :"OAuthCID:99"]]
    param :deletedonly, Params::Boolean
    param :toponly, Params::Boolean
    param :newonly, Params::Boolean
    param :hideminor, Params::Boolean
    param :showsizediff, Params::Boolean
  end
end