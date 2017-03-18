module MediaWiktory
  class Cxsave < Action
    symbol :cxsave
    post!
    param :from, Params::String
    param :to, Params::String
    param :sourcetitle, Params::String
    param :title, Params::String
    param :content, Params::String
    param :sourcerevision, Params::Integer
    param :progress, Params::String
    param :token, Params::String
  end
end