module MediaWiktory
  class Protectedtitles < MWModule
    symbol :protectedtitles
    prefix: "pt"
    param :namespace, Params::List[Params::Enum["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "2300", "2301", "2302", "2303", "710", "711", "446", "447", "2600", "828", "829"]]
    param :level, Params::List[Params::Enum["autoconfirmed", "templateeditor", "sysop", "superprotect"]]
    param :limit, Params::IntegerOrMax
    param :dir, Params::Enum["newer", "older"]
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :prop, Params::List[Params::Enum["timestamp", "user", "userid", "comment", "parsedcomment", "expiry", "level"]]
    param :continue, Params::String
  end
end