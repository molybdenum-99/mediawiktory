module MediaWiktory
  class Globalusage < MWModule
    symbol :globalusage
    prefix "gu"
    param :prop, Params::List[Params::Enum[:url, :pageid, :namespace]]
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
    param :filterlocal, Params::Boolean
  end
end