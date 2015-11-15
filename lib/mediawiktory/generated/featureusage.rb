module MediaWiktory
  class Featureusage < MWModule
    symbol :featureusage
    prefix: "afu"
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :agent, Params::String
    param :features, Params::List[Params::String]
  end
end