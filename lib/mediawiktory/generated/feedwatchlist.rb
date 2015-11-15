module MediaWiktory
  class Feedwatchlist < Action
    symbol :feedwatchlist
    param :feedformat, Params::Enum["rss", "atom"]
    param :hours, Params::Integer
    param :linktosections, Params::Boolean
    param :allrev, Params::Boolean
    param :wlowner, Params::String
    param :wltoken, Params::String
    param :wlshow, Params::List[Params::Enum["minor", "!minor", "bot", "!bot", "anon", "!anon", "patrolled", "!patrolled", "unread", "!unread"]]
    param :wltype, Params::List[Params::Enum["edit", "external", "new", "log"]]
    param :wlexcludeuser, Params::String
  end
end