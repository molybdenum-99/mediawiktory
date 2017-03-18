module MediaWiktory
  class Cxpublish < Action
    symbol :cxpublish
    post!
    param :title, Params::String
    param :html, Params::String
    param :from, Params::String
    param :to, Params::String
    param :sourcetitle, Params::String
    param :categories, Params::String
    param :wpCaptchaId, Params::String
    param :wpCaptchaWord, Params::String
    param :token, Params::String
  end
end