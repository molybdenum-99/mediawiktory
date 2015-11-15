module MediaWiktory
  class Pagepropnames < MWModule
    symbol :pagepropnames
    prefix "ppn"
    param :continue, Params::String
    param :limit, Params::IntegerOrMax
  end
end