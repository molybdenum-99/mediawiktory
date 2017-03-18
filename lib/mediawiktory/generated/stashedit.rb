module MediaWiktory
  class Stashedit < Action
    symbol :stashedit
    post!
    param :title, Params::String
    param :section, Params::String
    param :sectiontitle, Params::String
    param :text, Params::String
    param :stashedtexthash, Params::String
    param :summary, Params::String
    param :contentmodel, Params::Enum[:GadgetDefinition, :SecurePoll, :MassMessageListContent, :JsonSchema, :wikitext, :javascript, :json, :css, :text, :Scribunto]
    param :contentformat, Params::Enum[:"application/json", :"text/x-wiki", :"text/javascript", :"text/css", :"text/plain"]
    param :baserevid, Params::Integer
    param :token, Params::String
  end
end