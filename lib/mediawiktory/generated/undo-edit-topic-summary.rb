module MediaWiktory
  class UndoEditTopicSummary < MWModule
    symbol :"undo-edit-topic-summary"
    prefix "uets"
    param :startId, Params::String
    param :endId, Params::String
  end
end