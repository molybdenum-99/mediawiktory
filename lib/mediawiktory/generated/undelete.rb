module MediaWiktory
  class Undelete < Action
    symbol :undelete
    post!
    param :title, Params::String
    param :reason, Params::String
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
    param :timestamps, Params::List[Params::Timestamp]
    param :fileids, Params::List[Params::Integer]
    param :watchlist, Params::Enum[:watch, :unwatch, :preferences, :nochange]
    param :token, Params::String
  end
end