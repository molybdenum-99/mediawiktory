module MediaWiktory
  class Deleteeducation < Action
    symbol :deleteeducation
    post!
    param :ids, Params::List[Params::Integer]
    param :type, Params::Enum[:org, :course]
    param :comment, Params::String
    param :token, Params::String
  end
end