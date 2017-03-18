module MediaWiktory
  class Mapdata < MWModule
    symbol :mapdata
    prefix "mpd"
    param :groups, Params::String
    param :limit, Params::IntegerOrMax
    param :continue, Params::Integer
  end
end