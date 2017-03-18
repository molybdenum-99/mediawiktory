module MediaWiktory
  class Pageviews < MWModule
    symbol :pageviews
    prefix "pvip"
    param :metric, Params::Enum[:pageviews]
    param :days, Params::Integer
    param :continue, Params::String
  end
end