module MediaWiktory
  class Users < MWModule
    symbol :users
    prefix "us"
    param :prop, Params::List[Params::Enum[:blockinfo, :groups, :implicitgroups, :rights, :editcount, :registration, :emailable, :gender]]
    param :users, Params::List[Params::String]
    param :token, Params::List[Params::Enum[:userrights]]
  end
end