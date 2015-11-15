module MediaWiktory
  class Addstudents < MWModule
    symbol :addstudents
    post!
    param :studentusernames, Params::List[Params::String]
    param :courseid, Params::Integer
    param :token, Params::String
  end
end