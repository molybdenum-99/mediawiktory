module MediaWiktory
  class Globalallusers < MWModule
    symbol :globalallusers
    prefix "agu"
    param :from, Params::String
    param :to, Params::String
    param :prefix, Params::String
    param :dir, Params::Enum[:ascending, :descending]
    param :group, Params::List[Params::Enum[:"OTRS-member", :"abusefilter-helper", :"apihighlimits-requestor", :"captcha-exempt", :"delete-global", :founder, :"global-bot", :"global-flow-create", :"global-interface-editor", :"global-ipblock-exempt", :"global-rollbacker", :"global-sysop", :"new-wikis-importer", :"oathauth-tester", :ombudsman, :"recursive-export", :staff, :steward, :sysadmin, :"wmf-ops-monitoring", :"wmf-researcher"]]
    param :excludegroup, Params::List[Params::Enum[:"OTRS-member", :"abusefilter-helper", :"apihighlimits-requestor", :"captcha-exempt", :"delete-global", :founder, :"global-bot", :"global-flow-create", :"global-interface-editor", :"global-ipblock-exempt", :"global-rollbacker", :"global-sysop", :"new-wikis-importer", :"oathauth-tester", :ombudsman, :"recursive-export", :staff, :steward, :sysadmin, :"wmf-ops-monitoring", :"wmf-researcher"]]
    param :prop, Params::List[Params::Enum[:lockinfo, :groups, :existslocally]]
    param :limit, Params::IntegerOrMax
  end
end