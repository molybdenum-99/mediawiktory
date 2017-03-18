module MediaWiktory
  class Links < MWModule
    symbol :links
    prefix "pl"
    param :namespace, Params::List[Params::Enum[:"-2", :"-1", :"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"446", :"447", :"710", :"711", :"828", :"829", :"2300", :"2301", :"2302", :"2303"]]
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
    param :titles, Params::List[Params::String]
    param :dir, Params::Enum[:ascending, :descending]
  end
end