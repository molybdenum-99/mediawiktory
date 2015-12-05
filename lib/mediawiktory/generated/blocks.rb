module MediaWiktory
  class Blocks < MWModule
    symbol :blocks
    prefix "bk"
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :dir, Params::Enum[:newer, :older]
    param :ids, Params::List[Params::Integer]
    param :users, Params::List[Params::String]
    param :ip, Params::String
    param :limit, Params::IntegerOrMax
    param :prop, Params::List[Params::Enum[:id, :user, :userid, :by, :byid, :timestamp, :expiry, :reason, :range, :flags]]
    param :show, Params::List[Params::Enum[:account, :"!account", :temp, :"!temp", :ip, :"!ip", :range, :"!range"]]
    param :continue, Params::String
  end
end