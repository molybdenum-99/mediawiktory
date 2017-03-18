module MediaWiktory
  class Tokens < Action
    symbol :tokens
    param :type, Params::List[Params::Enum[:block, :createaccount, :csrf, :delete, :deleteglobalaccount, :edit, :email, :import, :login, :move, :options, :patrol, :protect, :rollback, :setglobalaccountstatus, :unblock, :userrights, :watch]]
  end
end