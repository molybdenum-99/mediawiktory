module MediaWiktory
  class Flowthank < MWModule
    symbol :flowthank
    post!
    param :postid, Params::String
    param :token, Params::String
  end
end