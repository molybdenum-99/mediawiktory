module MediaWiktory
  class Clientlogin < Action
    symbol :clientlogin
    prefix "login"
    post!
    param :requests, Params::List[Params::String]
    param :messageformat, Params::Enum[:html, :wikitext, :raw, :none]
    param :mergerequestfields, Params::Boolean
    param :preservestate, Params::Boolean
    param :returnurl, Params::String
    param :continue, Params::Boolean
    param :token, Params::String
    param :*, Params::String
  end
end