module MediaWiktory
  class Extracts < MWModule
    symbol :extracts
    prefix "ex"
    param :chars, Params::Integer
    param :sentences, Params::Integer
    param :limit, Params::IntegerOrMax
    param :intro, Params::Boolean
    param :plaintext, Params::Boolean
    param :sectionformat, Params::Enum["plain", "wiki", "raw"]
    param :continue, Params::Integer
    param :variant, Params::String
  end
end