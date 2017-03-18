module MediaWiktory
  class Move < Action
    symbol :move
    post!
    param :from, Params::String
    param :fromid, Params::Integer
    param :to, Params::String
    param :reason, Params::String
    param :movetalk, Params::Boolean
    param :movesubpages, Params::Boolean
    param :noredirect, Params::Boolean
    param :watch, Params::Boolean
    param :unwatch, Params::Boolean
    param :watchlist, Params::Enum[:watch, :unwatch, :preferences, :nochange]
    param :ignorewarnings, Params::Boolean
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
    param :token, Params::String
  end
end