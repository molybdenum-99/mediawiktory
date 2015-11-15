module MediaWiktory
  class Wikibase < MWModule
    symbol :wikibase
    prefix "wb"
    param :prop, Params::List[Params::Enum["url", "siteid"]]
  end
end