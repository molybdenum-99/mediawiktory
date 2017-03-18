module MediaWiktory
  class Rollback < Action
    symbol :rollback
    post!
    param :title, Params::String
    param :pageid, Params::Integer
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
    param :user, Params::String
    param :summary, Params::String
    param :markbot, Params::Boolean
    param :watchlist, Params::Enum[:watch, :unwatch, :preferences, :nochange]
    param :token, Params::String
  end
end