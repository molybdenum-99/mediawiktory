module MediaWiktory
  class Info < MWModule
    symbol :info
    prefix "in"
    param :prop, Params::List[Params::Enum["protection", "talkid", "watched", "watchers", "notificationtimestamp", "subjectid", "url", "readable", "preload", "displaytitle"]]
    param :testactions, Params::List[Params::String]
    param :token, Params::List[Params::Enum["edit", "delete", "protect", "move", "block", "unblock", "email", "import", "watch"]]
    param :continue, Params::String
  end
end