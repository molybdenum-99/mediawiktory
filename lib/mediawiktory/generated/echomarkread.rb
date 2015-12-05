module MediaWiktory
  class Echomarkread < Action
    symbol :echomarkread
    post!
    param :list, Params::List[Params::String]
    param :all, Params::Boolean
    param :sections, Params::List[Params::Enum[:alert, :message]]
    param :token, Params::String
  end
end