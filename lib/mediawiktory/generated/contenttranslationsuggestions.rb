module MediaWiktory
  class Contenttranslationsuggestions < MWModule
    symbol :contenttranslationsuggestions
    param :from, Params::String
    param :to, Params::String
    param :limit, Params::IntegerOrMax
    param :offset, Params::String
    param :seed, Params::Integer
  end
end