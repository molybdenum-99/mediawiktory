module MediaWiktory
  class Shortenurl < Action
    symbol :shortenurl
    post!
    param :url, Params::String
  end
end