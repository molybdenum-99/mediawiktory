module MediaWiktory
  class Mystashedfiles < MWModule
    symbol :mystashedfiles
    prefix "msf"
    param :prop, Params::List[Params::Enum[:size, :type]]
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
  end
end