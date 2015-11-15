module MediaWiktory
  class Pagetriagelist < MWModule
    symbol :pagetriagelist
    param :page_id, Params::Integer
    param :showbots, Params::Boolean
    param :showredirs, Params::Boolean
    param :showreviewed, Params::Boolean
    param :showunreviewed, Params::Boolean
    param :showdeleted, Params::Boolean
    param :limit, Params::Integer
    param :offset, Params::Integer
    param :pageoffset, Params::Integer
    param :dir, Params::String
    param :namespace, Params::Integer
    param :no_category, Params::Boolean
    param :no_inbound_links, Params::Boolean
    param :non_autoconfirmed_users, Params::Boolean
    param :blocked_users, Params::Boolean
    param :username, Params::String
  end
end