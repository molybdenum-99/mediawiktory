module MediaWiktory
  class Categorytree < Action
    symbol :categorytree
    param :category, Params::String
    param :options, Params::String
  end
end