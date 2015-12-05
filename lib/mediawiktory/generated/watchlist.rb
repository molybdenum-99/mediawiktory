module MediaWiktory
  class Watchlist < MWModule
    symbol :watchlist
    prefix "wl"
    param :allrev, Params::Boolean
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :namespace, Params::List[Params::Enum[:"0", :"1", :"2", :"3", :"4", :"5", :"6", :"7", :"8", :"9", :"10", :"11", :"12", :"13", :"14", :"15", :"100", :"101", :"108", :"109", :"118", :"119", :"2300", :"2301", :"2302", :"2303", :"710", :"711", :"446", :"447", :"2600", :"828", :"829"]]
    param :user, Params::String
    param :excludeuser, Params::String
    param :dir, Params::Enum[:newer, :older]
    param :limit, Params::IntegerOrMax
    param :prop, Params::List[Params::Enum[:ids, :title, :flags, :user, :userid, :comment, :parsedcomment, :timestamp, :patrol, :sizes, :notificationtimestamp, :loginfo]]
    param :show, Params::List[Params::Enum[:minor, :"!minor", :bot, :"!bot", :anon, :"!anon", :patrolled, :"!patrolled", :unread, :"!unread"]]
    param :type, Params::List[Params::Enum[:edit, :external, :new, :log]]
    param :owner, Params::String
    param :token, Params::String
    param :continue, Params::String
  end
end