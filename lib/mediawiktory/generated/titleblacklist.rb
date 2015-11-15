module MediaWiktory
  class Titleblacklist < MWModule
    symbol :titleblacklist
    prefix: "tb"
    param :title, Params::String
    param :action, Params::Enum["create", "edit", "upload", "createtalk", "createpage", "move", "new-account"]
    param :nooverride, Params::String
  end
end