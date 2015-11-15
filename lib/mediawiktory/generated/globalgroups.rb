module MediaWiktory
  class Globalgroups < MWModule
    symbol :globalgroups
    prefix "ggp"
    param :prop, Params::List[Params::Enum["rights"]]
  end
end