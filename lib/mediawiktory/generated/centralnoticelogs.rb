module MediaWiktory
  class Centralnoticelogs < MWModule
    symbol :centralnoticelogs
    param :campaign, Params::String
    param :user, Params::String
    param :limit, Params::IntegerOrMax
    param :offset, Params::Integer
    param :start, Params::Timestamp
    param :end, Params::Timestamp
  end
end