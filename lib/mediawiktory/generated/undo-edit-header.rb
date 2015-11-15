module MediaWiktory
  class UndoEditHeader < MWModule
    symbol :"undo-edit-header"
    prefix "ueh"
    param :startId, Params::String
    param :endId, Params::String
  end
end