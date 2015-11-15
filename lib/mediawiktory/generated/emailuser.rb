module MediaWiktory
  class Emailuser < MWModule
    symbol :emailuser
    post!
    param :target, Params::String
    param :subject, Params::String
    param :text, Params::String
    param :ccme, Params::Boolean
    param :token, Params::String
  end
end