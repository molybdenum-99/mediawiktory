module MediaWiktory
  class Spamblacklist < MWModule
    symbol :spamblacklist
    param :url, Params::List[Params::String]
  end
end