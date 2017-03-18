module MediaWiktory
  class Echomarkseen < Action
    symbol :echomarkseen
    post!
    param :token, Params::String
    param :type, Params::Enum[:alert, :message, :all]
    param :timestampFormat, Params::Enum[:ISO_8601, :MW]
  end
end