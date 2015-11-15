module MediaWiktory
  class Langbacklinks < MWModule
    symbol :langbacklinks
    prefix: "lbl"
    param :lang, Params::String
    param :title, Params::String
    param :continue, Params::String
    param :limit, Params::IntegerOrMax
    param :prop, Params::List[Params::Enum["lllang", "lltitle"]]
    param :dir, Params::Enum["ascending", "descending"]
  end
end