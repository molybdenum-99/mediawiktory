module MediaWiktory
  class Patrol < Action
    symbol :patrol
    post!
    param :rcid, Params::Integer
    param :revid, Params::Integer
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
    param :token, Params::String
  end
end