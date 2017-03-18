module MediaWiktory
  class Pageimages < MWModule
    symbol :pageimages
    prefix "pi"
    param :prop, Params::List[Params::Enum[:thumbnail, :original, :name]]
    param :thumbsize, Params::Integer
    param :limit, Params::IntegerOrMax
    param :license, Params::Enum[:free, :any]
    param :continue, Params::Integer
  end
end