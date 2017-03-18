module MediaWiktory
  class Globaluserrights < Action
    symbol :globaluserrights
    post!
    param :user, Params::String
    param :userid, Params::Integer
    param :add, Params::List[Params::Enum[:"OTRS-member", :"abusefilter-helper", :"apihighlimits-requestor", :"captcha-exempt", :"delete-global", :founder, :"global-bot", :"global-flow-create", :"global-interface-editor", :"global-ipblock-exempt", :"global-rollbacker", :"global-sysop", :"new-wikis-importer", :"oathauth-tester", :ombudsman, :"recursive-export", :staff, :steward, :sysadmin, :"wmf-ops-monitoring", :"wmf-researcher"]]
    param :remove, Params::List[Params::Enum[:"OTRS-member", :"abusefilter-helper", :"apihighlimits-requestor", :"captcha-exempt", :"delete-global", :founder, :"global-bot", :"global-flow-create", :"global-interface-editor", :"global-ipblock-exempt", :"global-rollbacker", :"global-sysop", :"new-wikis-importer", :"oathauth-tester", :ombudsman, :"recursive-export", :staff, :steward, :sysadmin, :"wmf-ops-monitoring", :"wmf-researcher"]]
    param :reason, Params::String
    param :token, Params::String
    param :tags, Params::List[Params::Enum[:Noticeboarddisruption, :ProveItedit, :WPCleaner, :huggle, :largeplotaddition]]
  end
end