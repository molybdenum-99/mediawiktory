module MediaWiktory
  class Massmessage < Action
    symbol :massmessage
    post!
    param :spamlist, Params::String
    param :subject, Params::String
    param :message, Params::String
    param :token, Params::String
  end
end