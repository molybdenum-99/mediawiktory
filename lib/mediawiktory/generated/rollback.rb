module MediaWiktory
  class Rollback < MWModule
    symbol :rollback
    post!
    param :title, Params::String
    param :pageid, Params::Integer
    param :user, Params::String
    param :summary, Params::String
    param :markbot, Params::Boolean
    param :watchlist, Params::Enum["watch", "unwatch", "preferences", "nochange"]
    param :token, Params::String
  end
end