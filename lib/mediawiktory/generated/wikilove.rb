module MediaWiktory
  class Wikilove < Action
    symbol :wikilove
    post!
    param :title, Params::String
    param :text, Params::String
    param :message, Params::String
    param :token, Params::String
    param :subject, Params::String
    param :type, Params::String
    param :email, Params::String
  end
end