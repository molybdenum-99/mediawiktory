module MediaWiktory
  class Opensearch < MWModule
    symbol :opensearch
    param :search, Params::String
    param :limit, Params::IntegerOrMax
    param :namespace, Params::List[Params::Enum["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "2300", "2301", "2302", "2303", "710", "711", "446", "447", "2600", "828", "829"]]
    param :suggest, Params::Boolean
    param :redirects, Params::Enum["return", "resolve"]
    param :format, Params::Enum["json", "jsonfm", "xml", "xmlfm"]
    param :warningsaserror, Params::Boolean
  end
end