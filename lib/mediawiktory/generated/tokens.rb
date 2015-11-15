module MediaWiktory
  class Tokens < MWModule
    symbol :tokens
    param :type, Params::List[Params::Enum["csrf", "deleteglobalaccount", "patrol", "rollback", "setglobalaccountstatus", "userrights", "watch"]]
  end
end