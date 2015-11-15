module MediaWiktory
  class Visualeditor < Action
    symbol :visualeditor
    param :page, Params::String
    param :format, Params::Enum["json", "jsonfm"]
    param :paction, Params::Enum["parse", "metadata", "parsefragment", "serialize", "serializeforcache", "diff", "getlanglinks"]
    param :wikitext, Params::String
    param :oldid, Params::String
    param :html, Params::String
    param :cachekey, Params::String
    param :pst, Params::Boolean
  end
end