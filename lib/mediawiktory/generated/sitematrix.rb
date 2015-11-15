module MediaWiktory
  class Sitematrix < MWModule
    symbol :sitematrix
    prefix: "sm"
    param :type, Params::List[Params::Enum["special", "language"]]
    param :state, Params::List[Params::Enum["closed", "private", "fishbowl"]]
    param :langprop, Params::List[Params::Enum["code", "name", "site", "localname"]]
    param :siteprop, Params::List[Params::Enum["url", "dbname", "code", "sitename"]]
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
  end
end