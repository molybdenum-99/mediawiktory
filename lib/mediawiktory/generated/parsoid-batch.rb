module MediaWiktory
  class ParsoidBatch < MWModule
    symbol :"parsoid-batch"
    param :batch, Params::String
  end
end