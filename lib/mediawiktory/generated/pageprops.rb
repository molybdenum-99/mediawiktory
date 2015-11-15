module MediaWiktory
  class Pageprops < MWModule
    symbol :pageprops
    prefix "pp"
    param :continue, Params::String
    param :prop, Params::List[Params::String]
  end
end