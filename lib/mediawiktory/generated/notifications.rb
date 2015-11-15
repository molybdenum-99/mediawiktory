module MediaWiktory
  class Notifications < MWModule
    symbol :notifications
    prefix: "not"
    param :prop, Params::List[Params::Enum["list", "count", "index"]]
    param :sections, Params::List[Params::Enum["alert", "message"]]
    param :groupbysection, Params::Boolean
    param :format, Params::Enum["text", "flyout", "html"]
    param :limit, Params::IntegerOrMax
    param :index, Params::Boolean
    param :continue, Params::String
    param :alertcontinue, Params::String
    param :alertunreadfirst, Params::Boolean
    param :messagecontinue, Params::String
    param :messageunreadfirst, Params::Boolean
  end
end