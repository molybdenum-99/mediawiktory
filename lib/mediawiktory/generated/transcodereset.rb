module MediaWiktory
  class Transcodereset < Action
    symbol :transcodereset
    post!
    param :title, Params::String
    param :transcodekey, Params::String
    param :token, Params::String
  end
end