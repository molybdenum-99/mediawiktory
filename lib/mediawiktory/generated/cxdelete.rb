module MediaWiktory
  class Cxdelete < Action
    symbol :cxdelete
    post!
    param :from, Params::String
    param :to, Params::String
    param :sourcetitle, Params::String
    param :token, Params::String
  end
end