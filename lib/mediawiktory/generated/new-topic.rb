module MediaWiktory
  class NewTopic < MWModule
    symbol :"new-topic"
    prefix: "nt"
    post!
    param :topic, Params::String
    param :content, Params::String
    param :format, Params::Enum["html", "wikitext"]
    param :token, Params::String
  end
end