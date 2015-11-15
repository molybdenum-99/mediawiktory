module MediaWiktory
  class Block < MWModule
    symbol :block
    post!
    param :user, Params::String
    param :expiry, Params::String
    param :reason, Params::String
    param :anononly, Params::Boolean
    param :nocreate, Params::Boolean
    param :autoblock, Params::Boolean
    param :noemail, Params::Boolean
    param :hidename, Params::Boolean
    param :allowusertalk, Params::Boolean
    param :reblock, Params::Boolean
    param :watchuser, Params::Boolean
    param :token, Params::String
  end
end