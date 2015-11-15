module MediaWiktory
  class EditTopicSummary < MWModule
    symbol :"edit-topic-summary"
    prefix: "ets"
    post!
    param :prev_revision, Params::String
    param :summary, Params::String
    param :format, Params::Enum["html", "wikitext"]
    param :token, Params::String
  end
end