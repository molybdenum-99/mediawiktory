module MediaWiktory
  class Recentchanges < MWModule
    symbol :recentchanges
    prefix "rc"
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :dir, Params::Enum["newer", "older"]
    param :namespace, Params::List[Params::Enum["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "2300", "2301", "2302", "2303", "710", "711", "446", "447", "2600", "828", "829"]]
    param :user, Params::String
    param :excludeuser, Params::String
    param :tag, Params::String
    param :prop, Params::List[Params::Enum["user", "userid", "comment", "parsedcomment", "flags", "timestamp", "title", "ids", "sizes", "redirect", "patrolled", "loginfo", "tags", "sha1"]]
    param :token, Params::List[Params::Enum["patrol"]]
    param :show, Params::List[Params::Enum["minor", "!minor", "bot", "!bot", "anon", "!anon", "redirect", "!redirect", "patrolled", "!patrolled", "unpatrolled"]]
    param :limit, Params::IntegerOrMax
    param :type, Params::List[Params::Enum["edit", "external", "new", "log"]]
    param :toponly, Params::Boolean
    param :continue, Params::String
  end
end