module MediaWiktory
  class Cxpublish < Action
    symbol :cxpublish
    post!
    param :title, Params::String
    param :token, Params::String
    param :html, Params::String
    param :from, Params::String
    param :progress, Params::String
    param :to, Params::String
    param :sourcetitle, Params::String
    param :sourcerevision, Params::String
    param :status, Params::Enum[:draft, :published]
    param :categories, Params::String
    param :wpCaptchaId, Params::String
    param :wpCaptchaWord, Params::String
  end
end