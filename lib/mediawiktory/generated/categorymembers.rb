module MediaWiktory
  class Categorymembers < MWModule
    symbol :categorymembers
    prefix: "cm"
    param :title, Params::String
    param :pageid, Params::Integer
    param :prop, Params::List[Params::Enum["ids", "title", "sortkey", "sortkeyprefix", "type", "timestamp"]]
    param :namespace, Params::List[Params::Enum["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "2300", "2301", "2302", "2303", "710", "711", "446", "447", "2600", "828", "829"]]
    param :type, Params::List[Params::Enum["page", "subcat", "file"]]
    param :continue, Params::String
    param :limit, Params::IntegerOrMax
    param :sort, Params::Enum["sortkey", "timestamp"]
    param :dir, Params::Enum["asc", "desc", "ascending", "descending", "newer", "older"]
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :starthexsortkey, Params::String
    param :endhexsortkey, Params::String
    param :startsortkeyprefix, Params::String
    param :endsortkeyprefix, Params::String
    param :startsortkey, Params::String
    param :endsortkey, Params::String
  end
end