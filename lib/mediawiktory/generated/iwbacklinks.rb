module MediaWiktory
  class Iwbacklinks < MWModule
    symbol :iwbacklinks
    prefix: "iwbl"
    param :prefix, Params::String
    param :title, Params::String
    param :continue, Params::String
    param :limit, Params::IntegerOrMax
    param :prop, Params::List[Params::Enum["iwprefix", "iwtitle"]]
    param :dir, Params::Enum["ascending", "descending"]
  end
end