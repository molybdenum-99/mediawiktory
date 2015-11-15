module MediaWiktory
  class Refresheducation < MWModule
    symbol :refresheducation
    post!
    param :ids, Params::List[Params::Integer]
    param :type, Params::Enum["org", "course", "student"]
    param :token, Params::String
  end
end