module MediaWiktory
  class Zeroconfig < MWModule
    symbol :zeroconfig
    param :type, Params::Enum["config", "message"]
    param :agent, Params::String
  end
end