module MediaWiktory
  class Languagesearch < Action
    symbol :languagesearch
    param :search, Params::String
    param :typos, Params::Integer
  end
end