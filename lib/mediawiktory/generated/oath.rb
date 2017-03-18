module MediaWiktory
  class Oath < MWModule
    symbol :oath
    prefix "oath"
    param :user, Params::String
  end
end