module MediaWiktory
  class Setglobalaccountstatus < MWModule
    symbol :setglobalaccountstatus
    post!
    param :user, Params::String
    param :locked, Params::Enum["lock", "unlock"]
    param :hidden, Params::Enum["lists", "suppressed"]
    param :reason, Params::String
    param :token, Params::String
    param :statecheck, Params::String
  end
end