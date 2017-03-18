module MediaWiktory
  class Cspreport < Action
    symbol :cspreport
    post!
    param :reportonly, Params::Boolean
    param :source, Params::String
  end
end