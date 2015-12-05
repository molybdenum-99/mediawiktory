module MediaWiktory
  class Reviewactivity < Action
    symbol :reviewactivity
    post!
    param :previd, Params::String
    param :oldid, Params::String
    param :reviewing, Params::Enum[:"0", :"1"]
    param :token, Params::String
  end
end