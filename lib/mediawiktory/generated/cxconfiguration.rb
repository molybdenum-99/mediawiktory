module MediaWiktory
  class Cxconfiguration < Action
    symbol :cxconfiguration
    param :from, Params::String
    param :to, Params::String
  end
end