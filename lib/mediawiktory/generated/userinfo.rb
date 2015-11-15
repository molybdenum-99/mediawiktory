module MediaWiktory
  class Userinfo < MWModule
    symbol :userinfo
    prefix "ui"
    param :prop, Params::List[Params::Enum["blockinfo", "hasmsg", "groups", "implicitgroups", "rights", "changeablegroups", "options", "preferencestoken", "editcount", "ratelimits", "email", "realname", "acceptlang", "registrationdate", "unreadcount"]]
  end
end