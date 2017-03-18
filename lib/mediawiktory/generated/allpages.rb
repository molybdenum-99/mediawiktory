module MediaWiktory
  class Allpages < MWModule
    symbol :allpages
    prefix "ap"
    param :from, Params::String
    param :continue, Params::String
    param :to, Params::String
    param :prefix, Params::String
    param :namespace, Params::Enum[:"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"446", :"447", :"710", :"711", :"828", :"829", :"2300", :"2301", :"2302", :"2303"]
    param :filterredir, Params::Enum[:all, :redirects, :nonredirects]
    param :minsize, Params::Integer
    param :maxsize, Params::Integer
    param :prtype, Params::List[Params::Enum[:edit, :move, :upload]]
    param :prlevel, Params::List[Params::Enum[:autoconfirmed, :extendedconfirmed, :templateeditor, :sysop]]
    param :prfiltercascade, Params::Enum[:cascading, :noncascading, :all]
    param :limit, Params::IntegerOrMax
    param :dir, Params::Enum[:ascending, :descending]
    param :filterlanglinks, Params::Enum[:withlanglinks, :withoutlanglinks, :all]
    param :prexpiry, Params::Enum[:indefinite, :definite, :all]
  end
end