module MediaWiktory
  class Pageassessments < MWModule
    symbol :pageassessments
    prefix "pa"
    param :continue, Params::String
    param :limit, Params::IntegerOrMax
    param :subprojects, Params::Boolean
  end
end