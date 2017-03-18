module MediaWiktory
  class Block < Action
    symbol :block
    post!
    param :user, Params::String
    param :userid, Params::Integer
    param :expiry, Params::String
    param :reason, Params::String
    param :anononly, Params::Boolean
    param :nocreate, Params::Boolean
    param :autoblock, Params::Boolean
    param :noemail, Params::Boolean
    param :hidename, Params::Boolean
    param :allowusertalk, Params::Boolean
    param :reblock, Params::Boolean
    param :watchuser, Params::Boolean
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
    param :token, Params::String
  end
end