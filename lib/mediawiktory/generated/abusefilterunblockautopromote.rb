module MediaWiktory
  class Abusefilterunblockautopromote < MWModule
    symbol :abusefilterunblockautopromote
    post!
    param :user, Params::String
    param :token, Params::String
  end
end