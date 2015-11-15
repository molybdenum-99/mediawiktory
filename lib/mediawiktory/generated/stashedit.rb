module MediaWiktory
  class Stashedit < Action
    symbol :stashedit
    post!
    param :title, Params::String
    param :section, Params::String
    param :sectiontitle, Params::String
    param :text, Params::String
    param :contentmodel, Params::Enum["MassMessageListContent", "wikitext", "javascript", "json", "css", "text", "SecurePoll", "flow-board", "Scribunto", "JsonSchema"]
    param :contentformat, Params::Enum["application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain"]
    param :baserevid, Params::Integer
    param :token, Params::String
  end
end