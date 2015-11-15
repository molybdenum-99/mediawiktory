module MediaWiktory
  class Cxpublishedtranslations < MWModule
    symbol :cxpublishedtranslations
    param :from, Params::String
    param :to, Params::String
    param :limit, Params::IntegerOrMax
    param :offset, Params::String
  end
end