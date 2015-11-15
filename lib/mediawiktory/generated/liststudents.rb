module MediaWiktory
  class Liststudents < Action
    symbol :liststudents
    param :courseids, Params::List[Params::Integer]
    param :prop, Params::Enum["username", "id"]
    param :group, Params::Boolean
    param :csv, Params::Boolean
  end
end