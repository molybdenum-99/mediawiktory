module MediaWiktory
  class Antispoof < Action
    symbol :antispoof
    param :username, Params::String
  end
end