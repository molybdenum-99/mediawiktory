module MediaWiktory
  class Flowthank < Action
    symbol :flowthank
    post!
    param :postid, Params::String
    param :token, Params::String
  end
end