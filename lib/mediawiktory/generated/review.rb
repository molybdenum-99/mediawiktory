module MediaWiktory
  class Review < MWModule
    symbol :review
    post!
    param :revid, Params::String
    param :token, Params::String
    param :comment, Params::String
    param :unapprove, Params::Boolean
  end
end