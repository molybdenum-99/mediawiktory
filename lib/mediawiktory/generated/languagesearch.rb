module MediaWiktory
  class Languagesearch < MWModule
    symbol :languagesearch
    param :search, Params::String
    param :typos, Params::Integer
  end
end