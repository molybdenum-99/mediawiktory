module MediaWiktory
  class ScribuntoConsole < MWModule
    symbol :"scribunto-console"
    param :title, Params::String
    param :content, Params::String
    param :session, Params::Integer
    param :question, Params::String
    param :clear, Params::Boolean
  end
end