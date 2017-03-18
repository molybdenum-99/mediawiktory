module MediaWiktory
  class Allrevisions < MWModule
    symbol :allrevisions
    prefix "arv"
    param :prop, Params::List[Params::Enum[:ids, :flags, :timestamp, :user, :userid, :size, :sha1, :contentmodel, :comment, :parsedcomment, :content, :tags, :parsetree]]
    param :limit, Params::IntegerOrMax
    param :expandtemplates, Params::Boolean
    param :generatexml, Params::Boolean
    param :parse, Params::Boolean
    param :section, Params::String
    param :diffto, Params::String
    param :difftotext, Params::String
    param :difftotextpst, Params::Boolean
    param :contentformat, Params::Enum[:"application/json", :"text/x-wiki", :"text/javascript", :"text/css", :"text/plain"]
    param :user, Params::String
    param :namespace, Params::List[Params::Enum[:"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"446", :"447", :"710", :"711", :"828", :"829", :"2300", :"2301", :"2302", :"2303"]]
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :dir, Params::Enum[:newer, :older]
    param :excludeuser, Params::String
    param :continue, Params::String
    param :generatetitles, Params::Boolean
  end
end