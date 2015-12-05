module MediaWiktory
  class Feedcontributions < Action
    symbol :feedcontributions
    param :feedformat, Params::Enum[:rss, :atom]
    param :user, Params::String
    param :namespace, Params::Enum[:"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"2300", :"2301", :"2302", :"2303", :"710", :"711", :"446", :"447", :"2600", :"828", :"829"]
    param :year, Params::Integer
    param :month, Params::Integer
    param :tagfilter, Params::List[Params::Enum[:Huggle, :WPCleaner, :huggle, :possiblevandalism, :ExternalLinkaddedtodisambiguationpage, :cannededitsummary, :newblankarticle, :extraneousmarkup, :"de-userfying", :Possibleselfpromotioninuserspace, :signatureadded, :discretionarysanctionsalert, :imageaddedtotemplate, :nowikiadded, :Additionofinterwikilink, :Removalofallinterwikilinks, :userspacespam, :changingheightorweight, :possiblelibelorvandalism, :Endofpagetext, :"non-Englishcontent", :Extraneousformatting, :"revertinganti-vandalbot", :Possiblevandalism, :Removalofinterwikilink, :Rapidreverts, :addingemailaddress, :nonsensecharacters, :removalofcopyviotemplates, :badexternal, :largeunwikifiednewarticle, :removalofarticlesfordeletiontemplate, :Sectionblanking, :possiblecutandpastemove, :unusualredirect, :"coi-spam", :autobiography, :repeatingcharacters, :categoriesremoved, :"removalofCategory:LivingPeople", :veryshortnewarticle, :possiblelinkspam, :referencelistremoval, :imagetemplateremoval, :shouting, :talkpageblanking, :blanking, :removalofspeedydeletiontemplates, :"self-renamingandbadusertalkmoves", :wikilove, :mobileappedit, :mobileedit, :mobilewebedit, :HHVM, :"OAuthCID:115", :"OAuthCID:142", :"OAuthCID:144", :"OAuthCID:150", :"OAuthCID:151", :"OAuthCID:154", :"OAuthCID:159", :"OAuthCID:194", :"OAuthCID:206", :"OAuthCID:21", :"OAuthCID:211", :"OAuthCID:212", :"OAuthCID:218", :"OAuthCID:236", :"OAuthCID:239", :"OAuthCID:251", :"OAuthCID:252", :"OAuthCID:259", :"OAuthCID:261", :"OAuthCID:263", :"OAuthCID:278", :"OAuthCID:285", :"OAuthCID:297", :"OAuthCID:306", :"OAuthCID:60", :"OAuthCID:64", :"OAuthCID:67", :"OAuthCID:76", :"OAuthCID:85", :"OAuthCID:99", :visualeditor, :"visualeditor-needcheck", :"visualeditor-switched", :contenttranslation]]
    param :deletedonly, Params::Boolean
    param :toponly, Params::Boolean
    param :newonly, Params::Boolean
    param :showsizediff, Params::Boolean
  end
end