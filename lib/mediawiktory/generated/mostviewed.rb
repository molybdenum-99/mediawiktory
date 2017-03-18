module MediaWiktory
  class Mostviewed < MWModule
    symbol :mostviewed
    prefix "pvim"
    param :metric, Params::Enum[:pageviews]
    param :limit, Params::IntegerOrMax
    param :offset, Params::Integer
  end
end