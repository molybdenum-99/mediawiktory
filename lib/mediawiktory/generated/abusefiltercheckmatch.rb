module MediaWiktory
  class Abusefiltercheckmatch < MWModule
    symbol :abusefiltercheckmatch
    param :filter, Params::String
    param :vars, Params::String
    param :rcid, Params::Integer
    param :logid, Params::Integer
  end
end