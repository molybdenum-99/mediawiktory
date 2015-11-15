module MediaWiktory
  class Stabilize < Action
    symbol :stabilize
    post!
    param :protectlevel, Params::Enum["autoconfirmed", "review", "none"]
    param :expiry, Params::String
    param :reason, Params::String
    param :watch, Params::String
    param :token, Params::String
    param :title, Params::String
  end
end