module MediaWiktory
  class Centralnoticechoicedata < Action
    symbol :centralnoticechoicedata
    param :project, Params::String
    param :language, Params::String
  end
end