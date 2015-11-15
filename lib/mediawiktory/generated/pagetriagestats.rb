module MediaWiktory
  class Pagetriagestats < Action
    symbol :pagetriagestats
    param :namespace, Params::Integer
    param :showredirs, Params::Boolean
    param :showreviewed, Params::Boolean
    param :showunreviewed, Params::Boolean
    param :showdeleted, Params::Boolean
  end
end