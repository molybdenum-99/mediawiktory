module MediaWiktory
  class Jsonconfig < MWModule
    symbol :jsonconfig
    param :command, Params::Enum["status", "reset", "reload"]
    param :title, Params::String
    param :content, Params::String
  end
end