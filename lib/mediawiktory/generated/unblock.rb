module MediaWiktory
  class Unblock < Action
    symbol :unblock
    post!
    param :id, Params::Integer
    param :user, Params::String
    param :userid, Params::Integer
    param :reason, Params::String
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
    param :token, Params::String
  end
end