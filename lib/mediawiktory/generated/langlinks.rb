module MediaWiktory
  class Langlinks < MWModule
    symbol :langlinks
    prefix "ll"
    param :prop, Params::List[Params::Enum["url", "langname", "autonym"]]
    param :lang, Params::String
    param :title, Params::String
    param :dir, Params::Enum["ascending", "descending"]
    param :inlanguagecode, Params::String
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
    param :url, Params::Boolean
  end
end