module MediaWiktory::Wikipedia::Modules
  # Get pages for which there are unread notifications for the current user. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.unreadnotificationpages(**options).perform # returns string with raw output
  # # or
  # api.some_action.unreadnotificationpages(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.unreadnotificationpages.wikis(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Unreadnotificationpages < MediaWiktory::Submodule
    # List of wikis to fetch pages with unread notifications from (defaults to only current wiki).
    #
    # @param values [Array<String>] Allowed values: "aawiki", "aawikibooks", "aawiktionary", "abwiki", "abwiktionary", "acewiki", "advisorywiki", "adywiki", "afwiki", "afwikibooks", "afwikiquote", "afwiktionary", "akwiki", "akwikibooks", "akwiktionary", "alswiki", "alswikibooks", "alswikiquote", "alswiktionary", "amwiki", "amwikiquote", "amwiktionary", "angwiki", "angwikibooks", "angwikiquote", "angwikisource", "angwiktionary", "anwiki", "anwiktionary", "arbcom_cswiki", "arbcom_dewiki", "arbcom_enwiki", "arbcom_fiwiki", "arbcom_nlwiki", "arcwiki", "arwiki", "arwikibooks", "arwikimedia", "arwikinews", "arwikiquote", "arwikisource", "arwikiversity", "arwiktionary", "arzwiki", "astwiki", "astwikibooks", "astwikiquote", "astwiktionary", "aswiki", "aswikibooks", "aswikisource", "aswiktionary", "auditcomwiki", "avwiki", "avwiktionary", "aywiki", "aywikibooks", "aywiktionary", "azwiki", "azwikibooks", "azwikiquote", "azwikisource", "azwiktionary", "azbwiki", "barwiki", "bat_smgwiki", "bawiki", "bawikibooks", "bclwiki", "bdwikimedia", "be_x_oldwiki", "betawikiversity", "bewiki", "bewikibooks", "bewikimedia", "bewikiquote", "bewikisource", "bewiktionary", "bgwiki", "bgwikibooks", "bgwikinews", "bgwikiquote", "bgwikisource", "bgwiktionary", "bhwiki", "bhwiktionary", "biwiki", "biwikibooks", "biwiktionary", "bjnwiki", "bmwiki", "bmwikibooks", "bmwikiquote", "bmwiktionary", "bnwiki", "bnwikibooks", "bnwikisource", "bnwiktionary", "boardgovcomwiki", "boardwiki", "bowiki", "bowikibooks", "bowiktionary", "bpywiki", "brwiki", "brwikimedia", "brwikiquote", "brwikisource", "brwiktionary", "bswiki", "bswikibooks", "bswikinews", "bswikiquote", "bswikisource", "bswiktionary", "bugwiki", "bxrwiki", "cawiki", "cawikibooks", "cawikimedia", "cawikinews", "cawikiquote", "cawikisource", "cawiktionary", "cbk_zamwiki", "cdowiki", "cebwiki", "cewiki", "chairwiki", "chapcomwiki", "checkuserwiki", "chowiki", "chrwiki", "chrwiktionary", "chwiki", "chwikibooks", "chwiktionary", "chywiki", "ckbwiki", "cnwikimedia", "collabwiki", "commonswiki", "cowiki", "cowikibooks", "cowikimedia", "cowikiquote", "cowiktionary", "crhwiki", "crwiki", "crwikiquote", "crwiktionary", "csbwiki", "csbwiktionary", "cswiki", "cswikibooks", "cswikinews", "cswikiquote", "cswikisource", "cswikiversity", "cswiktionary", "cuwiki", "cvwiki", "cvwikibooks", "cywiki", "cywikibooks", "cywikiquote", "cywikisource", "cywiktionary", "dawiki", "dawikibooks", "dawikiquote", "dawikisource", "dawiktionary", "dewiki", "dewikibooks", "dewikinews", "dewikiquote", "dewikisource", "dewikiversity", "dewikivoyage", "dewiktionary", "diqwiki", "dkwikimedia", "donatewiki", "dsbwiki", "dvwiki", "dvwiktionary", "dzwiki", "dzwiktionary", "ecwikimedia", "eewiki", "elwiki", "elwikibooks", "elwikinews", "elwikiquote", "elwikisource", "elwikiversity", "elwikivoyage", "elwiktionary", "emlwiki", "enwiki", "enwikibooks", "enwikinews", "enwikiquote", "enwikisource", "enwikiversity", "enwikivoyage", "enwiktionary", "eowiki", "eowikibooks", "eowikinews", "eowikiquote", "eowikisource", "eowiktionary", "eswiki", "eswikibooks", "eswikinews", "eswikiquote", "eswikisource", "eswikiversity", "eswikivoyage", "eswiktionary", "etwiki", "etwikibooks", "etwikimedia", "etwikiquote", "etwikisource", "etwiktionary", "euwiki", "euwikibooks", "euwikiquote", "euwiktionary", "execwiki", "extwiki", "fawiki", "fawikibooks", "fawikinews", "fawikiquote", "fawikisource", "fawikivoyage", "fawiktionary", "fdcwiki", "ffwiki", "fiu_vrowiki", "fiwiki", "fiwikibooks", "fiwikimedia", "fiwikinews", "fiwikiquote", "fiwikisource", "fiwikiversity", "fiwikivoyage", "fiwiktionary", "fjwiki", "fjwiktionary", "foundationwiki", "fowiki", "fowikisource", "fowiktionary", "frpwiki", "frrwiki", "frwiki", "frwikibooks", "frwikinews", "frwikiquote", "frwikisource", "frwikiversity", "frwikivoyage", "frwiktionary", "furwiki", "fywiki", "fywikibooks", "fywiktionary", "gagwiki", "ganwiki", "gawiki", "gawikibooks", "gawikiquote", "gawiktionary", "gdwiki", "gdwiktionary", "glkwiki", "glwiki", "glwikibooks", "glwikiquote", "glwikisource", "glwiktionary", "gnwiki", "gnwikibooks", "gnwiktionary", "gomwiki", "gotwiki", "gotwikibooks", "grantswiki", "guwiki", "guwikibooks", "guwikiquote", "guwikisource", "guwiktionary", "gvwiki", "gvwiktionary", "hakwiki", "hawiki", "hawiktionary", "hawwiki", "hewiki", "hewikibooks", "hewikinews", "hewikiquote", "hewikisource", "hewikivoyage", "hewiktionary", "hifwiki", "hiwiki", "hiwikibooks", "hiwikiquote", "hiwiktionary", "howiki", "hrwiki", "hrwikibooks", "hrwikiquote", "hrwikisource", "hrwiktionary", "hsbwiki", "hsbwiktionary", "htwiki", "htwikisource", "huwiki", "huwikibooks", "huwikinews", "huwikiquote", "huwikisource", "huwiktionary", "hywiki", "hywikibooks", "hywikiquote", "hywikisource", "hywiktionary", "hzwiki", "iawiki", "iawikibooks", "iawiktionary", "idwiki", "idwikibooks", "idwikiquote", "idwikisource", "idwiktionary", "iegcomwiki", "iewiki", "iewikibooks", "iewiktionary", "igwiki", "iiwiki", "ikwiki", "ikwiktionary", "ilowiki", "ilwikimedia", "incubatorwiki", "internalwiki", "iowiki", "iowiktionary", "iswiki", "iswikibooks", "iswikiquote", "iswikisource", "iswiktionary", "itwiki", "itwikibooks", "itwikinews", "itwikiquote", "itwikisource", "itwikiversity", "itwikivoyage", "itwiktionary", "iuwiki", "iuwiktionary", "jamwiki", "jawiki", "jawikibooks", "jawikinews", "jawikiquote", "jawikisource", "jawikiversity", "jawiktionary", "jbowiki", "jbowiktionary", "jvwiki", "jvwiktionary", "kaawiki", "kabwiki", "kawiki", "kawikibooks", "kawikiquote", "kawiktionary", "kbdwiki", "kgwiki", "kiwiki", "kjwiki", "kkwiki", "kkwikibooks", "kkwikiquote", "kkwiktionary", "klwiki", "klwiktionary", "kmwiki", "kmwikibooks", "kmwiktionary", "knwiki", "knwikibooks", "knwikiquote", "knwikisource", "knwiktionary", "koiwiki", "kowiki", "kowikibooks", "kowikinews", "kowikiquote", "kowikisource", "kowikiversity", "kowiktionary", "krcwiki", "krwiki", "krwikiquote", "kshwiki", "kswiki", "kswikibooks", "kswikiquote", "kswiktionary", "kuwiki", "kuwikibooks", "kuwikiquote", "kuwiktionary", "kvwiki", "kwwiki", "kwwikiquote", "kwwiktionary", "kywiki", "kywikibooks", "kywikiquote", "kywiktionary", "labswiki", "labtestwiki", "ladwiki", "lawiki", "lawikibooks", "lawikiquote", "lawikisource", "lawiktionary", "lbewiki", "lbwiki", "lbwikibooks", "lbwikiquote", "lbwiktionary", "legalteamwiki", "lezwiki", "lgwiki", "lijwiki", "liwiki", "liwikibooks", "liwikiquote", "liwikisource", "liwiktionary", "lmowiki", "lnwiki", "lnwikibooks", "lnwiktionary", "loginwiki", "lowiki", "lowiktionary", "lrcwiki", "ltgwiki", "ltwiki", "ltwikibooks", "ltwikiquote", "ltwikisource", "ltwiktionary", "lvwiki", "lvwikibooks", "lvwiktionary", "maiwiki", "map_bmswiki", "mdfwiki", "mediawikiwiki", "metawiki", "mgwiki", "mgwikibooks", "mgwiktionary", "mhrwiki", "mhwiki", "mhwiktionary", "minwiki", "miwiki", "miwikibooks", "miwiktionary", "mkwiki", "mkwikibooks", "mkwikimedia", "mkwikisource", "mkwiktionary", "mlwiki", "mlwikibooks", "mlwikiquote", "mlwikisource", "mlwiktionary", "mnwiki", "mnwikibooks", "mnwiktionary", "movementroleswiki", "mowiki", "mowiktionary", "mrjwiki", "mrwiki", "mrwikibooks", "mrwikiquote", "mrwikisource", "mrwiktionary", "mswiki", "mswikibooks", "mswiktionary", "mtwiki", "mtwiktionary", "muswiki", "mwlwiki", "mxwikimedia", "myvwiki", "mywiki", "mywikibooks", "mywiktionary", "mznwiki", "nahwiki", "nahwikibooks", "nahwiktionary", "napwiki", "nawiki", "nawikibooks", "nawikiquote", "nawiktionary", "nds_nlwiki", "ndswiki", "ndswikibooks", "ndswikiquote", "ndswiktionary", "newiki", "newikibooks", "newiktionary", "newwiki", "ngwiki", "nlwiki", "nlwikibooks", "nlwikimedia", "nlwikinews", "nlwikiquote", "nlwikisource", "nlwikivoyage", "nlwiktionary", "nnwiki", "nnwikiquote", "nnwiktionary", "noboard_chapterswikimedia", "nostalgiawiki", "novwiki", "nowiki", "nowikibooks", "nowikimedia", "nowikinews", "nowikiquote", "nowikisource", "nowiktionary", "nrmwiki", "nsowiki", "nvwiki", "nycwikimedia", "nywiki", "nzwikimedia", "ocwiki", "ocwikibooks", "ocwiktionary", "officewiki", "olowiki", "ombudsmenwiki", "omwiki", "omwiktionary", "orwiki", "orwikisource", "orwiktionary", "oswiki", "otrs_wikiwiki", "outreachwiki", "pa_uswikimedia", "pagwiki", "pamwiki", "papwiki", "pawiki", "pawikibooks", "pawikisource", "pawiktionary", "pcdwiki", "pdcwiki", "pflwiki", "pihwiki", "piwiki", "piwiktionary", "plwiki", "plwikibooks", "plwikimedia", "plwikinews", "plwikiquote", "plwikisource", "plwikivoyage", "plwiktionary", "pmswiki", "pnbwiki", "pnbwiktionary", "pntwiki", "projectcomwiki", "pswiki", "pswikibooks", "pswiktionary", "ptwiki", "ptwikibooks", "ptwikinews", "ptwikiquote", "ptwikisource", "ptwikiversity", "ptwikivoyage", "ptwiktionary", "qualitywiki", "quwiki", "quwikibooks", "quwikiquote", "quwiktionary", "rmwiki", "rmwikibooks", "rmwiktionary", "rmywiki", "rnwiki", "rnwiktionary", "roa_rupwiki", "roa_rupwiktionary", "roa_tarawiki", "rowiki", "rowikibooks", "rowikinews", "rowikiquote", "rowikisource", "rowikivoyage", "rowiktionary", "rswikimedia", "ruewiki", "ruwiki", "ruwikibooks", "ruwikimedia", "ruwikinews", "ruwikiquote", "ruwikisource", "ruwikiversity", "ruwikivoyage", "ruwiktionary", "rwwiki", "rwwiktionary", "sahwiki", "sahwikisource", "sawiki", "sawikibooks", "sawikiquote", "sawikisource", "sawiktionary", "scnwiki", "scnwiktionary", "scowiki", "scwiki", "scwiktionary", "sdwiki", "sdwikinews", "sdwiktionary", "searchcomwiki", "sewiki", "sewikibooks", "sewikimedia", "sgwiki", "sgwiktionary", "shwiki", "shwiktionary", "simplewiki", "simplewikibooks", "simplewikiquote", "simplewiktionary", "siwiki", "siwikibooks", "siwiktionary", "skwiki", "skwikibooks", "skwikiquote", "skwikisource", "skwiktionary", "slwiki", "slwikibooks", "slwikiquote", "slwikisource", "slwikiversity", "slwiktionary", "smwiki", "smwiktionary", "snwiki", "snwiktionary", "sourceswiki", "sowiki", "sowiktionary", "spcomwiki", "specieswiki", "sqwiki", "sqwikibooks", "sqwikinews", "sqwikiquote", "sqwiktionary", "srnwiki", "srwiki", "srwikibooks", "srwikinews", "srwikiquote", "srwikisource", "srwiktionary", "sswiki", "sswiktionary", "stewardwiki", "stqwiki", "strategywiki", "stwiki", "stwiktionary", "suwiki", "suwikibooks", "suwikiquote", "suwiktionary", "svwiki", "svwikibooks", "svwikinews", "svwikiquote", "svwikisource", "svwikiversity", "svwikivoyage", "svwiktionary", "swwiki", "swwikibooks", "swwiktionary", "szlwiki", "tawiki", "tawikibooks", "tawikinews", "tawikiquote", "tawikisource", "tawiktionary", "tcywiki", "tenwiki", "test2wiki", "testwiki", "testwikidatawiki", "tetwiki", "tewiki", "tewikibooks", "tewikiquote", "tewikisource", "tewiktionary", "tgwiki", "tgwikibooks", "tgwiktionary", "thwiki", "thwikibooks", "thwikinews", "thwikiquote", "thwikisource", "thwiktionary", "tiwiki", "tiwiktionary", "tkwiki", "tkwikibooks", "tkwikiquote", "tkwiktionary", "tlwiki", "tlwikibooks", "tlwiktionary", "tnwiki", "tnwiktionary", "towiki", "towiktionary", "tpiwiki", "tpiwiktionary", "transitionteamwiki", "trwiki", "trwikibooks", "trwikimedia", "trwikinews", "trwikiquote", "trwikisource", "trwiktionary", "tswiki", "tswiktionary", "ttwiki", "ttwikibooks", "ttwikiquote", "ttwiktionary", "tumwiki", "twwiki", "twwiktionary", "tyvwiki", "tywiki", "uawikimedia", "udmwiki", "ugwiki", "ugwikibooks", "ugwikiquote", "ugwiktionary", "ukwiki", "ukwikibooks", "ukwikimedia", "ukwikinews", "ukwikiquote", "ukwikisource", "ukwikivoyage", "ukwiktionary", "urwiki", "urwikibooks", "urwikiquote", "urwiktionary", "usabilitywiki", "uzwiki", "uzwikibooks", "uzwikiquote", "uzwiktionary", "vecwiki", "vecwikisource", "vecwiktionary", "vepwiki", "vewiki", "viwiki", "viwikibooks", "viwikiquote", "viwikisource", "viwikivoyage", "viwiktionary", "vlswiki", "votewiki", "vowiki", "vowikibooks", "vowikiquote", "vowiktionary", "warwiki", "wawiki", "wawikibooks", "wawiktionary", "wbwikimedia", "wg_enwiki", "wikidatawiki", "wikimania2005wiki", "wikimania2006wiki", "wikimania2007wiki", "wikimania2008wiki", "wikimania2009wiki", "wikimania2010wiki", "wikimania2011wiki", "wikimania2012wiki", "wikimania2013wiki", "wikimania2014wiki", "wikimania2015wiki", "wikimania2016wiki", "wikimania2017wiki", "wikimaniateamwiki", "wowiki", "wowikiquote", "wowiktionary", "wuuwiki", "xalwiki", "xhwiki", "xhwikibooks", "xhwiktionary", "xmfwiki", "yiwiki", "yiwikisource", "yiwiktionary", "yowiki", "yowikibooks", "yowiktionary", "zawiki", "zawikibooks", "zawikiquote", "zawiktionary", "zeawiki", "zerowiki", "zh_classicalwiki", "zh_min_nanwiki", "zh_min_nanwikibooks", "zh_min_nanwikiquote", "zh_min_nanwikisource", "zh_min_nanwiktionary", "zh_yuewiki", "zhwiki", "zhwikibooks", "zhwikinews", "zhwikiquote", "zhwikisource", "zhwikivoyage", "zhwiktionary", "zuwiki", "zuwikibooks", "zuwiktionary", "*".
    # @return [self]
    def wikis(*values)
      merge(unpwikis: values.join('|'))
    end
    # Group talk pages together with their subject page, and group notifications not associated with a page together with the current user's user page.
    #
    # @return [self]
    def grouppages()
      merge(unpgrouppages: 'true')
    end
    # The maximum number of pages to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(unplimit: value.to_s)
    end

  end
end