module MediaWiktory
  class Usercontribs < MWModule
    symbol :usercontribs
    prefix "uc"
    param :limit, Params::IntegerOrMax
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :continue, Params::String
    param :user, Params::List[Params::String]
    param :userids, Params::List[Params::Integer]
    param :userprefix, Params::String
    param :dir, Params::Enum[:newer, :older]
    param :namespace, Params::List[Params::Enum[:"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"446", :"447", :"710", :"711", :"828", :"829", :"2300", :"2301", :"2302", :"2303"]]
    param :prop, Params::List[Params::Enum[:ids, :title, :timestamp, :comment, :parsedcomment, :size, :sizediff, :flags, :patrolled, :tags]]
    param :show, Params::List[Params::Enum[:minor, :"!minor", :patrolled, :"!patrolled", :top, :"!top", :new, :"!new"]]
    param :tag, Params::String
    param :toponly, Params::Boolean
  end
end