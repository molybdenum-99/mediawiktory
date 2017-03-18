module MediaWiktory
  class Cxsuggestionlist < Action
    symbol :cxsuggestionlist
    post!
    param :listname, Params::String
    param :listaction, Params::Enum[:add, :remove]
    param :titles, Params::List[Params::String]
    param :from, Params::String
    param :to, Params::String
    param :token, Params::String
  end
end