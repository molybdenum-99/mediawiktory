module MediaWiktory
  class Revisions < MWModule
    symbol :revisions
    prefix "rv"
    param :prop, Params::List[Params::Enum[:ids, :flags, :timestamp, :user, :userid, :size, :sha1, :contentmodel, :comment, :parsedcomment, :content, :tags, :parsetree, :flagged]]
    param :limit, Params::IntegerOrMax
    param :expandtemplates, Params::Boolean
    param :generatexml, Params::Boolean
    param :parse, Params::Boolean
    param :section, Params::String
    param :diffto, Params::String
    param :difftotext, Params::String
    param :contentformat, Params::Enum[:"application/json", :"text/x-wiki", :"text/javascript", :"text/css", :"text/plain"]
    param :startid, Params::Integer
    param :endid, Params::Integer
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :dir, Params::Enum[:newer, :older]
    param :user, Params::String
    param :excludeuser, Params::String
    param :tag, Params::String
    param :token, Params::List[Params::Enum[:rollback]]
    param :continue, Params::String
  end
end