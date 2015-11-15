module MediaWiktory
  class Visualeditoredit < MWModule
    symbol :visualeditoredit
    post!
    param :page, Params::String
    param :token, Params::String
    param :wikitext, Params::String
    param :basetimestamp, Params::String
    param :starttimestamp, Params::String
    param :oldid, Params::String
    param :minor, Params::String
    param :watch, Params::String
    param :html, Params::String
    param :summary, Params::String
    param :captchaid, Params::String
    param :captchaword, Params::String
    param :cachekey, Params::String
  end
end