module MediaWiktory
  class Spamblacklist < Action
    symbol :spamblacklist
    param :url, Params::List[Params::String]
  end
end