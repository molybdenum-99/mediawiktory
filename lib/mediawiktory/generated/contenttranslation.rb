module MediaWiktory
  class Contenttranslation < MWModule
    symbol :contenttranslation
    param :translationid, Params::String
    param :from, Params::String
    param :to, Params::String
    param :sourcetitle, Params::String
    param :limit, Params::IntegerOrMax
    param :offset, Params::String
    param :type, Params::Enum["draft", "published"]
  end
end