module MediaWiktory
  class Filerevert < MWModule
    symbol :filerevert
    post!
    param :filename, Params::String
    param :comment, Params::String
    param :archivename, Params::String
    param :token, Params::String
  end
end