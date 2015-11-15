module MediaWiktory
  class FlowParsoidUtils < MWModule
    symbol :"flow-parsoid-utils"
    param :from, Params::Enum["html", "wikitext"]
    param :to, Params::Enum["html", "wikitext"]
    param :content, Params::String
    param :title, Params::String
    param :pageid, Params::Integer
  end
end