module MediaWiktory
  class Pagetriageaction < Action
    symbol :pagetriageaction
    post!
    param :pageid, Params::Integer
    param :reviewed, Params::Enum["1", "0"]
    param :token, Params::String
    param :note, Params::String
    param :skipnotif, Params::Boolean
  end
end