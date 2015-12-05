module MediaWiktory
  class Linkshere < MWModule
    symbol :linkshere
    prefix "lh"
    param :prop, Params::List[Params::Enum[:pageid, :title, :redirect]]
    param :namespace, Params::List[Params::Enum[:"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"2300", :"2301", :"2302", :"2303", :"710", :"711", :"446", :"447", :"2600", :"828", :"829"]]
    param :show, Params::List[Params::Enum[:redirect, :"!redirect"]]
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
  end
end