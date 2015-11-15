module MediaWiktory
  class Contenttranslationlangtrend < MWModule
    symbol :contenttranslationlangtrend
    param :source, Params::String
    param :target, Params::String
    param :interval, Params::Enum["week", "month"]
  end
end