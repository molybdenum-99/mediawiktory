module MediaWiktory
  class Imageusage < MWModule
    symbol :imageusage
    prefix "iu"
    param :title, Params::String
    param :pageid, Params::Integer
    param :continue, Params::String
    param :namespace, Params::List[Params::Enum[:"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"446", :"447", :"710", :"711", :"828", :"829", :"2300", :"2301", :"2302", :"2303"]]
    param :dir, Params::Enum[:ascending, :descending]
    param :filterredir, Params::Enum[:all, :redirects, :nonredirects]
    param :limit, Params::IntegerOrMax
    param :redirect, Params::Boolean
  end
end