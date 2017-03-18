module MediaWiktory
  class Projects < MWModule
    symbol :projects
    prefix "pj"
    param :subprojects, Params::Boolean
  end
end