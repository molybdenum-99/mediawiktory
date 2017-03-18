module MediaWiktory
  class Deletedrevs < MWModule
    symbol :deletedrevs
    prefix "dr"
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :dir, Params::Enum[:newer, :older]
    param :from, Params::String
    param :to, Params::String
    param :prefix, Params::String
    param :unique, Params::Boolean
    param :namespace, Params::Enum[:"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"446", :"447", :"710", :"711", :"828", :"829", :"2300", :"2301", :"2302", :"2303"]
    param :tag, Params::String
    param :user, Params::String
    param :excludeuser, Params::String
    param :prop, Params::List[Params::Enum[:revid, :parentid, :user, :userid, :comment, :parsedcomment, :minor, :len, :sha1, :content, :token, :tags]]
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
  end
end