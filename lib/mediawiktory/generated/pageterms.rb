module MediaWiktory
  class Pageterms < MWModule
    symbol :pageterms
    prefix: "wbpt"
    param :continue, Params::Integer
    param :terms, Params::List[Params::Enum["alias", "description", "label"]]
  end
end