module MediaWiktory
  class Managetags < Action
    symbol :managetags
    post!
    param :operation, Params::Enum[:create, :delete, :activate, :deactivate]
    param :tag, Params::String
    param :reason, Params::String
    param :ignorewarnings, Params::Boolean
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
    param :token, Params::String
  end
end