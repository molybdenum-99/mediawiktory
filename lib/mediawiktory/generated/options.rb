module MediaWiktory
  class Options < Action
    symbol :options
    post!
    param :reset, Params::Boolean
    param :resetkinds, Params::List[Params::Enum[:registered, :"registered-multiselect", :"registered-checkmatrix", :userjs, :special, :unused, :all]]
    param :change, Params::List[Params::String]
    param :optionname, Params::String
    param :optionvalue, Params::String
    param :token, Params::String
  end
end