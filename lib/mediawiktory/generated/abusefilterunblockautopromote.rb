module MediaWiktory
  class Abusefilterunblockautopromote < Action
    symbol :abusefilterunblockautopromote
    post!
    param :user, Params::String
    param :token, Params::String
  end
end