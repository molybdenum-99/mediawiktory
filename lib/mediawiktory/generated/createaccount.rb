module MediaWiktory
  class Createaccount < Action
    symbol :createaccount
    post!
    param :name, Params::String
    param :password, Params::String
    param :domain, Params::String
    param :token, Params::String
    param :email, Params::String
    param :realname, Params::String
    param :mailpassword, Params::Boolean
    param :reason, Params::String
    param :language, Params::String
    param :captchaword, Params::String
    param :captchaid, Params::String
    param :ignoreantispoof, Params::Boolean
  end
end