module MediaWiktory
  class Projectpages < MWModule
    symbol :projectpages
    prefix "wpp"
    param :assessments, Params::Boolean
    param :projects, Params::List[Params::String]
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
  end
end