module MediaWiktory
  class Transcodereset < MWModule
    symbol :transcodereset
    post!
    param :title, Params::String
    param :transcodekey, Params::String
    param :token, Params::String
  end
end