module MediaWiktory
  class Contenttranslationcorpora < MWModule
    symbol :contenttranslationcorpora
    param :translationid, Params::Integer
    param :striphtml, Params::Boolean
    param :types, Params::List[Params::Enum[:source, :mt, :user]]
  end
end