module MediaWiktory
  class Edit < MWModule
    symbol :edit
    post!
    param :title, Params::String
    param :pageid, Params::Integer
    param :section, Params::String
    param :sectiontitle, Params::String
    param :text, Params::String
    param :summary, Params::String
    param :tags, Params::List[Params::Enum["Huggle", "WPCleaner", "huggle"]]
    param :minor, Params::Boolean
    param :notminor, Params::Boolean
    param :bot, Params::Boolean
    param :basetimestamp, Params::Timestamp
    param :starttimestamp, Params::Timestamp
    param :recreate, Params::Boolean
    param :createonly, Params::Boolean
    param :nocreate, Params::Boolean
    param :watch, Params::Boolean
    param :unwatch, Params::Boolean
    param :watchlist, Params::Enum["watch", "unwatch", "preferences", "nochange"]
    param :md5, Params::String
    param :prependtext, Params::String
    param :appendtext, Params::String
    param :undo, Params::Integer
    param :undoafter, Params::Integer
    param :redirect, Params::Boolean
    param :contentformat, Params::Enum["application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain"]
    param :contentmodel, Params::Enum["MassMessageListContent", "wikitext", "javascript", "json", "css", "text", "SecurePoll", "flow-board", "Scribunto", "JsonSchema"]
    param :token, Params::String
    param :captchaword, Params::String
    param :captchaid, Params::String
  end
end