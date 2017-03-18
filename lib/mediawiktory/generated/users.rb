module MediaWiktory
  class Users < MWModule
    symbol :users
    prefix "us"
    param :prop, Params::List[Params::Enum[:blockinfo, :groups, :groupmemberships, :implicitgroups, :rights, :editcount, :registration, :emailable, :gender, :centralids, :cancreate]]
    param :attachedwiki, Params::String
    param :users, Params::List[Params::String]
    param :userids, Params::List[Params::Integer]
    param :token, Params::List[Params::Enum[:userrights]]
  end
end