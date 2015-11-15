module MediaWiktory
  class Addstudents < Action
    symbol :addstudents
    post!
    param :studentusernames, Params::List[Params::String]
    param :courseid, Params::Integer
    param :token, Params::String
  end
end