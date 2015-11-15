module MediaWiktory
  class Allmessages < MWModule
    symbol :allmessages
    prefix: "am"
    param :messages, Params::List[Params::String]
    param :prop, Params::List[Params::Enum["default"]]
    param :enableparser, Params::Boolean
    param :nocontent, Params::Boolean
    param :includelocal, Params::Boolean
    param :args, Params::List[Params::String]
    param :filter, Params::String
    param :customised, Params::Enum["all", "modified", "unmodified"]
    param :lang, Params::String
    param :from, Params::String
    param :to, Params::String
    param :title, Params::String
    param :prefix, Params::String
  end
end