module MediaWiktory
  class ViewTopicSummary < MWModule
    symbol :"view-topic-summary"
    prefix "vts"
    param :format, Params::Enum["html", "wikitext", "fixed-html"]
    param :revId, Params::String
  end
end