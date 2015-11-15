module MediaWiktory
  class Checktoken < Action
    symbol :checktoken
    param :type, Params::Enum["csrf", "deleteglobalaccount", "patrol", "rollback", "setglobalaccountstatus", "userrights", "watch"]
    param :token, Params::String
    param :maxtokenage, Params::Integer
  end
end