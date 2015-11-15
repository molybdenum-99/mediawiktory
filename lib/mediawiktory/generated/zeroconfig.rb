module MediaWiktory
  class Zeroconfig < Action
    symbol :zeroconfig
    param :type, Params::Enum["config", "message"]
    param :agent, Params::String
  end
end