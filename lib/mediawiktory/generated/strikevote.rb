module MediaWiktory
  class Strikevote < MWModule
    symbol :strikevote
    post!
    param :option, Params::Enum["strike", "unstrike"]
    param :reason, Params::String
    param :voteid, Params::Integer
    param :token, Params::String
  end
end