module MediaWiktory
  class CirrusSuggest < MWModule
    symbol :"cirrus-suggest"
    param :text, Params::String
    param :context, Params::String
    param :limit, Params::Integer
  end
end