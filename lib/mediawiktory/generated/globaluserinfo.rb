module MediaWiktory
  class Globaluserinfo < MWModule
    symbol :globaluserinfo
    prefix "gui"
    param :user, Params::String
    param :prop, Params::List[Params::Enum[:groups, :rights, :merged, :unattached, :editcount]]
  end
end