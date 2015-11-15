module MediaWiktory
  class Filerevert < Action
    symbol :filerevert
    post!
    param :filename, Params::String
    param :comment, Params::String
    param :archivename, Params::String
    param :token, Params::String
  end
end