module MediaWiktory
  class Visualeditoredit < Action
    symbol :visualeditoredit
    post!
    param :paction, Params::Enum[:serialize, :serializeforcache, :diff, :save]
    param :page, Params::String
    param :token, Params::String
    param :wikitext, Params::String
    param :section, Params::String
    param :sectiontitle, Params::String
    param :basetimestamp, Params::String
    param :starttimestamp, Params::String
    param :oldid, Params::String
    param :minor, Params::String
    param :watch, Params::String
    param :html, Params::String
    param :etag, Params::String
    param :summary, Params::String
    param :captchaid, Params::String
    param :captchaword, Params::String
    param :cachekey, Params::String
  end
end