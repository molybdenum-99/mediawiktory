module MediaWiktory
  class Protect < Action
    symbol :protect
    post!
    param :title, Params::String
    param :pageid, Params::Integer
    param :protections, Params::List[Params::String]
    param :expiry, Params::List[Params::String]
    param :reason, Params::String
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
    param :cascade, Params::Boolean
    param :watch, Params::Boolean
    param :watchlist, Params::Enum[:watch, :unwatch, :preferences, :nochange]
    param :token, Params::String
  end
end