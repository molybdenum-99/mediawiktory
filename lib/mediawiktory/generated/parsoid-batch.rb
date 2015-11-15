module MediaWiktory
  class ParsoidBatch < Action
    symbol :"parsoid-batch"
    param :batch, Params::String
  end
end