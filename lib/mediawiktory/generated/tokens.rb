module MediaWiktory
  class Tokens < MWModule
    symbol :tokens
    param :type, Params::List[Params::Enum["block", "centralauth", "delete", "deleteglobalaccount", "edit", "email", "import", "move", "options", "patrol", "protect", "setglobalaccountstatus", "unblock", "watch"]]
  end
end