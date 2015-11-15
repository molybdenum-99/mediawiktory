module MediaWiktory
  class CirrusSuggest < Action
    symbol :"cirrus-suggest"
    param :text, Params::String
    param :context, Params::String
    param :limit, Params::Integer
  end
end