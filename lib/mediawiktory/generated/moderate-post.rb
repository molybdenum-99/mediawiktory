module MediaWiktory
  class ModeratePost < MWModule
    symbol :"moderate-post"
    prefix: "mp"
    post!
    param :moderationState, Params::Enum["delete", "hide", "suppress", "restore", "unhide", "undelete", "unsuppress"]
    param :reason, Params::String
    param :postId, Params::String
    param :token, Params::String
  end
end