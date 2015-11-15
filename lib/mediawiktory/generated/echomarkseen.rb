module MediaWiktory
  class Echomarkseen < MWModule
    symbol :echomarkseen
    post!
    param :token, Params::String
    param :type, Params::Enum["alert", "message", "all"]
  end
end