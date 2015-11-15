module MediaWiktory
  class ModerateTopic < MWModule
    symbol :"moderate-topic"
    prefix: "mt"
    post!
    param :moderationState, Params::Enum["delete", "hide", "suppress", "restore", "unhide", "undelete", "unsuppress"]
    param :reason, Params::String
    param :token, Params::String
  end
end