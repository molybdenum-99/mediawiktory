module MediaWiktory
  class Graph < Action
    symbol :graph
    param :hash, Params::String
    param :title, Params::String
    param :text, Params::String
  end
end