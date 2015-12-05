module MediaWiktory
  class ViewTopiclist < MWModule
    symbol :"view-topiclist"
    prefix "vtl"
    param :"offset-dir", Params::Enum[:fwd, :rev]
    param :sortby, Params::Enum[:newest, :updated, :user]
    param :savesortby, Params::Boolean
    param :"offset-id", Params::String
    param :offset, Params::String
    param :"include-offset", Params::Boolean
    param :limit, Params::IntegerOrMax
    param :toconly, Params::Boolean
    param :format, Params::Enum[:html, :wikitext, :"fixed-html"]
  end
end