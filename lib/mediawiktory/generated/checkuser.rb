module MediaWiktory
  class Checkuser < MWModule
    symbol :checkuser
    prefix: "cu"
    post!
    param :request, Params::Enum["userips", "edits", "ipusers"]
    param :target, Params::String
    param :reason, Params::String
    param :limit, Params::IntegerOrMax
    param :timecond, Params::String
    param :xff, Params::String
    param :token, Params::String
  end
end