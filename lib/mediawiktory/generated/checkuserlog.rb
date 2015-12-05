module MediaWiktory
  class Checkuserlog < MWModule
    symbol :checkuserlog
    prefix "cul"
    param :user, Params::String
    param :target, Params::String
    param :limit, Params::IntegerOrMax
    param :dir, Params::Enum[:newer, :older]
    param :from, Params::Timestamp
    param :to, Params::Timestamp
    param :continue, Params::String
  end
end