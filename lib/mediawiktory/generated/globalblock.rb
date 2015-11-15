module MediaWiktory
  class Globalblock < MWModule
    symbol :globalblock
    post!
    param :target, Params::String
    param :expiry, Params::String
    param :unblock, Params::Boolean
    param :reason, Params::String
    param :anononly, Params::Boolean
    param :token, Params::String
  end
end