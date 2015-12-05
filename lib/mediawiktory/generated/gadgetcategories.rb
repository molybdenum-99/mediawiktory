module MediaWiktory
  class Gadgetcategories < MWModule
    symbol :gadgetcategories
    prefix "gc"
    param :prop, Params::List[Params::Enum[:name, :title, :members]]
    param :names, Params::List[Params::String]
  end
end