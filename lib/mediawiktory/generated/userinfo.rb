module MediaWiktory
  class Userinfo < MWModule
    symbol :userinfo
    prefix "ui"
    param :prop, Params::List[Params::Enum[:blockinfo, :hasmsg, :groups, :groupmemberships, :implicitgroups, :rights, :changeablegroups, :options, :preferencestoken, :editcount, :ratelimits, :email, :realname, :acceptlang, :registrationdate, :unreadcount, :centralids]]
    param :attachedwiki, Params::String
  end
end