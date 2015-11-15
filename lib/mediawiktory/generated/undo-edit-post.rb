module MediaWiktory
  class UndoEditPost < MWModule
    symbol :"undo-edit-post"
    prefix: "uep"
    param :startId, Params::String
    param :endId, Params::String
  end
end