module MediaWiktory
  class Authmanagerinfo < MWModule
    symbol :authmanagerinfo
    prefix "ami"
    param :securitysensitiveoperation, Params::String
    param :requestsfor, Params::Enum[:login, :"login-continue", :create, :"create-continue", :link, :"link-continue", :change, :remove, :unlink]
    param :mergerequestfields, Params::Boolean
    param :messageformat, Params::Enum[:html, :wikitext, :raw, :none]
  end
end